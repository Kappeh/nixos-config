#!/usr/bin/env bash
# create_disks.sh

set -euo pipefail

# Check if the script is being run as root
if [[ "$EUID" -ne 0 ]]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# Hard coded devices to install system to
RAW_DISK_1="/dev/disk/by-id/ata-Samsung_SSD_840_EVO_120GB_S1D5NSAFB84723E"
RAW_DISK_2="/dev/disk/by-id/ata-ADATA_SU650_2J0520043892"
STORAGE_DISK="/dev/disk/by-id/ata-Samsung_SSD_870_QVO_4TB_S5STNF0T405957D"

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
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk -w always -W always ${RAW_DISK_1}
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
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk -w always -W always ${RAW_DISK_2}
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

sleep 1

# Create main raid
echo $PASSWORD | cryptsetup luksFormat ${RAW_DISK_1}-part2
echo $PASSWORD | cryptsetup luksFormat ${RAW_DISK_2}-part2
echo $PASSWORD | cryptsetup open ${RAW_DISK_1}-part2 crypt1
echo $PASSWORD | cryptsetup open ${RAW_DISK_2}-part2 crypt2
RAID_UUID=$(mkfs.btrfs -m raid1 -d raid1 /dev/mapper/crypt1 /dev/mapper/crypt2 | grep UUID | cut -c 6- | xargs)

# Create subvolumes
mkdir -p /mnt/partition_root
mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2 /mnt/partition_root

btrfs subvolume create /mnt/partition_root/root      # The subvolume for '/', which will be cleared on every boot.
btrfs subvolume create /mnt/partition_root/backup	 # The subvolume for '/backup', containing system state and user data which should be persistent and backed up.
btrfs subvolume create /mnt/partition_root/persist   # The subvolume for '/persist', containing system state and user data which should be persistent.
btrfs subvolume create /mnt/partition_root/nix		 # The subvolume for '/nix', which needs to be persistent but is not worth backing up, as it's trivial to reconstruct/.
btrfs subvolume create /mnt/partition_root/snapshots # The subvolume for '/snapshots', which should be preserved across reboots and is used during backups.

umount /mnt/partition_root

# Wait
sleep 1

# Mount subvolumes
mkdir -p /mnt/system_root
mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=root /mnt/system_root

mkdir -p /mnt/system_root/backup
mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=backup /mnt/system_root/backup

mkdir -p /mnt/system_root/persist
mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=persist /mnt/system_root/persist

mkdir -p /mnt/system_root/nix
mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=nix /mnt/system_root/nix

mkdir -p /mnt/system_root/snapshots
mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=snapshots /mnt/system_root/snapshots

# Wait
sleep 1

# Mount root subvolume
mkdir -p /mnt/system_root/raid_root
mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2 /mnt/system_root/raid_root

# Create and mount EFI boot raid
# mdadm --create /dev/md0 --level=raid1 --raid-devices=2 --metadata=1.0 ${RAW_DISK_1}-part1 ${RAW_DISK_2}-part1
# mkfs.fat -F 32 /dev/md0
mkfs.fat -F 32 ${RAW_DISK_1}-part1
mkdir -p /mnt/system_root/boot
mount ${RAW_DISK_1}-part1 /mnt/system_root/boot

# Mount existing subvolumes
echo $PASSWORD | cryptsetup open ${STORAGE_DISK}-part1 crypt3
mkdir -p /mnt/system_root/storage_root
mount /dev/mapper/crypt3 -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2 /mnt/system_root/storage_root
mkdir -p /mnt/system_root/backups
mount /dev/mapper/crypt3 -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=backups /mnt/system_root/backups

# Generate nixos config
nixos-generate-config --root /mnt/system_root
cp /mnt/system_root/etc/nixos/hardware-configuration.nix /mnt/nixos-config/hosts/neri/hardware-configuration.nix

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
## root age key - used by system for managing secrets stored in config via sops
mkdir -p /mnt/system_root/persist/system/root/.config/sops/age
cp /mnt/keys/neri.keys.txt /mnt/system_root/persist/system/root/.config/sops/age/keys.txt
## kieran age key - used by kieran for managing secrets stored in config via sops
mkdir -p /mnt/system_root/persist/home/kieran/.config/sops/age
cp /mnt/keys/kieran.keys.txt /mnt/system_root/persist/home/kieran/.config/sops/age/keys.txt
chown -R 1000:100 /mnt/system_root/persist/home/kieran # kieran:users
## The root age key also needs to be copied into the current environment for installation
mkdir -p /persist/system/root/.config/sops/age
cp /mnt/keys/neri.keys.txt /persist/system/root/.config/sops/age/keys.txt

# Done
echo ""
echo "DISK SETUP COMPLETE -------------------------------------------------------------------"
# TODO: Move the additional config out of hardware configuration
echo "Please add a line to hardware-configuration.nix to open crypt2 at boot"
