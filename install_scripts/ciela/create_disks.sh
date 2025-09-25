#!/usr/bin/env bash
# create_disks.sh

set -euo pipefail

# Check if the script is being run as root
if [[ "$EUID" -ne 0 ]]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# Hard coded device to install system to
RAW_DISK="/dev/disk/by-id/ata-Samsung_SSD_870_QVO_4TB_S5STNF0T405957D"

# Function to prompt for password
password_prompt() {
    # Read password securely
    read -s -p "Enter password: " password_from_prompt
    echo
    read -s -p "Confirm password: " password_from_prompt_confirm
    echo

    # Check if passwords match
    if [ "$password_from_prompt" != "$password_from_prompt_confirm" ]; then
        echo "Passwords do not match. Please try again."
        return 1
    fi

    return 0
}

# Function to loop until a valid password is entered
loop_password_prompt_until_valid() {
    while true; do
        password_prompt
        if [ $? -eq 0 ]; then
            break
        fi
    done
}

# Prompt user for password
echo "Please enter a password for unlocking this device"
loop_password_prompt_until_valid
PASSWORD=$(echo -n $password_from_prompt)

# Partition Disks
#
# source: https://superuser.com/questions/332252/how-to-create-and-format-a-partition-using-a-bash-script
#
# to create the partitions programatically (rather than manually)
# we're going to simulate the manual input to fdisk
# The sed script strips off all the comments so that we can
# document what we're doing in-line with the actual commands
# Note that a blank line (commented as "defualt" will send a empty
# line terminated with a newline to take the fdisk default.
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk -w always -W always ${RAW_DISK}
  g # create a new empty GPT partition table
  n # new partition
  1 # partition number 1
    # default - first sector
  +500M # 500MB EFI partition
  t # change type of partition
  1 # EFI System
  n # new partition
  2 # partition number 2
    # default - first sector
    # default - last sector
  t # change type of partition
  2 # select partition 2
  20 # Linux filesystem
  w # write partition table
EOF

# Wait
sleep 1

# Create encrypted btrfs filesystem
echo -n $PASSWORD | cryptsetup luksFormat ${RAW_DISK}-part2
echo -n $PASSWORD | cryptsetup open ${RAW_DISK}-part2 crypt
mkfs.btrfs /dev/mapper/crypt

# Create subvolumes
mkdir -p /mnt/partition_root
mount -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2 /dev/mapper/crypt /mnt/partition_root

btrfs subvolume create /mnt/partition_root/root         # The subvolume for '/', which will be cleared on every boot.
btrfs subvolume create /mnt/partition_root/backup       # The subvolume for '/backup', containing system state and user data which should be persistent and backed up.
btrfs subvolume create /mnt/partition_root/persist      # The subvolume for '/persist', containing system state and user data which should be persistent.
btrfs subvolume create /mnt/partition_root/nix          # The subvolume for '/nix', which needs to be persistent but is not worth backing up, as it's trivial to reconstruct/.
btrfs subvolume create /mnt/partition_root/snapshots    # The subvolume for '/snapshots', which should be preserved across reboots and it used during backups.
btrfs subvolume create /mnt/partition_root/old_roots    # The subvolume storing the contents of root subvolume from previous boots

umount /mnt/partition_root
rmdir /mnt/partition_root

# Wait
sleep 1

# Mount subvolumes
mkdir -p /mnt/system_root
mount -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=root /dev/mapper/crypt /mnt/system_root

mkdir -p /mnt/system_root/backup
mount -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=backup /dev/mapper/crypt /mnt/system_root/backup

mkdir -p /mnt/system_root/persist
mount -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=persist /dev/mapper/crypt /mnt/system_root/persist

mkdir -p /mnt/system_root/nix
mount -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=nix /dev/mapper/crypt /mnt/system_root/nix

mkdir -p /mnt/system_root/snapshots
mount -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=snapshots /dev/mapper/crypt /mnt/system_root/snapshots

# Wait
sleep 1

# Mount root subvolume
mkdir -p /mnt/system_root/partition_root
mount -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2 /dev/mapper/crypt /mnt/system_root/partition_root

# Create and mount EFI boot
mkfs.fat -F 32 ${RAW_DISK}-part1
mkdir -p /mnt/system_root/boot
mount ${RAW_DISK}-part1 /mnt/system_root/boot

# Generate nixos config
nixos-generate-config --root /mnt/system_root
mkdir -p /mnt/ciela/config/hosts/ciela/
cp /mnt/system_root/etc/nixos/hardware-configuration.nix /mnt/nixos-config/hosts/ciela/hardware-configuration.nix

# Create persist/backup home/system directories
mkdir -p /mnt/system_root/persist/system
mkdir -p -m 700 /mnt/system_root/persist/system/root

mkdir -p /mnt/system_root/persist/home
mkdir -p -m 700 /mnt/system_root/persist/home/kieran

mkdir -p /mnt/system_root/backup/system
mkdir -p -m 700 /mnt/system_root/backup/system/root

mkdir -p /mnt/system_root/backup/home
mkdir -p -m 700 /mnt/system_root/backup/home/kieran

# Copy secret keys
## initrd host key - used to host ssh server during early boot to facilitate remote unlocking of encrypted partitions
mkdir -p /mnt/system_root/persist/system/etc/secrets/initrd
cp /mnt/keys/ciela_initrd_host_key_ed25519 /mnt/system_root/persist/system/etc/secrets/initrd/
## regular host key - used to host ssh server during normal operation
mkdir -p /mnt/system_root/persist/system/etc/ssh
cp /mnt/keys/ciela_host_key_ed25519 /mnt/system_root/persist/system/etc/ssh/
## root age key - used by system for managing secrets stored in config via sops
mkdir -p /mnt/system_root/persist/system/root/.config/sops/age
cp /mnt/keys/ciela.keys.txt /mnt/system_root/persist/system/root/.config/sops/age/keys.txt
## kieran age key - used by kieran for managing secrets stored in config via sops
mkdir -p /mnt/system_root/persist/home/kieran/.config/sops/age
cp /mnt/keys/kieran.keys.txt /mnt/system_root/persist/home/kieran/.config/sops/age/keys.txt
chown -R 1000:100 /mnt/system_root/persist/home/kieran # kieran:users
## The root age key and host keys also need to be copied into the current environment for installation
### initrd host key
mkdir -p /persist/system/etc/secrets/initrd
cp /mnt/keys/ciela_initrd_host_key_ed25519 /persist/system/etc/secrets/initrd/
### regular host key
mkdir -p /persist/system/etc/ssh
cp /mnt/keys/ciela_host_key_ed25519 /persist/system/etc/ssh/
### root age key
mkdir -p /persist/system/root/.config/sops/age
cp /mnt/keys/ciela.keys.txt /persist/system/root/.config/sops/age/keys.txt

# Done
echo ""
echo "DISK SETUP COMPLETE -------------------------------------------------------------------"
