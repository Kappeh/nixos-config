RAW_DISK_1="/dev/disk/by-id/ata-Samsung_SSD_840_EVO_120GB_S1D5NSAFB84723E"
RAW_DISK_2="/dev/disk/by-id/ata-ADATA_SU650_2J0520043892"
STORAGE_DISK="/dev/disk/by-id/ata-Samsung_SSD_870_QVO_4TB_S5STNF0T405957D"

PASSWORD=$(cat password.txt)

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
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo fdisk -w always -W always ${RAW_DISK_1}
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
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo fdisk -w always -W always ${RAW_DISK_2}
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
echo $PASSWORD | sudo cryptsetup luksFormat ${RAW_DISK_1}-part2
echo $PASSWORD | sudo cryptsetup luksFormat ${RAW_DISK_2}-part2
echo $PASSWORD | sudo cryptsetup open ${RAW_DISK_1}-part2 crypt1
echo $PASSWORD | sudo cryptsetup open ${RAW_DISK_2}-part2 crypt2
RAID_UUID=$(sudo mkfs.btrfs -m raid1 -d raid1 /dev/mapper/crypt1 /dev/mapper/crypt2 | grep UUID | cut -c 6- | xargs)

# Create subvolumes
sudo mkdir -p /mnt
sudo mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2 /mnt
sudo btrfs subvolume create /mnt/root		# The subvolume for '/', which will be cleared on every boot.
sudo btrfs subvolume create /mnt/backup		# The subvolume for '/backup', containing system state and user data which should be persistent and backed up.
sudo btrfs subvolume create /mnt/persist	# The subvolume for '/persist', containing system state and user data which should be persistent.
sudo btrfs subvolume create /mnt/nix		# The subvolume for '/nix', which needs to be persistent but is not worth backing up, as it's trivial to reconstruct/.
sudo btrfs subvolume create /mnt/log		# The subvolume for '/var/log', which should be preserved across reboots but I'm not interested in backing up.
sudo umount /mnt

sleep 1

# Mount subvolumes
sudo mkdir -p /mnt
sudo mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=root /mnt
sudo mkdir -p /mnt/backup
sudo mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=backup /mnt/backup
sudo mkdir -p /mnt/persist
sudo mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=persist /mnt/persist
sudo mkdir -p /mnt/nix
sudo mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=nix /mnt/nix
sudo mkdir -p /mnt/var/log
sudo mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2,subvol=log /mnt/var/log

sleep 1

# Mount root subvolume
sudo mkdir -p /mnt/raid_root
sudo mount UUID=$RAID_UUID -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2 /mnt/raid_root

# Create and mount EFI boot raid
# sudo mdadm --create /dev/md0 --level=raid1 --raid-devices=2 --metadata=1.0 ${RAW_DISK_1}-part1 ${RAW_DISK_2}-part1
# sudo mkfs.fat -F 32 /dev/md0
sudo mkfs.fat -F 32 ${RAW_DISK_1}-part1
sudo mkdir -p /mnt/boot
sudo mount ${RAW_DISK_1}-part1 /mnt/boot

# Mount existing subvolumes
echo $PASSWORD | sudo cryptsetup open ${STORAGE_DISK}-part1 crypt3 
sudo mkdir -p /mnt/storage_root
sudo mount /dev/mapper/crypt3 -o rw,noatime,compress-force=zstd:1,ssd,discard=async,space_cache=v2 /mnt/storage_root

# Generate nixos config
sudo nixos-generate-config --root /mnt
sudo cp /mnt/etc/nixos/hardware-configuration.nix /iso/config/hosts/neri/hardware-configuration.nix

# Create persist/backup home/system directories
sudo mkdir -p /mnt/persist/system
sudo mkdir -p -m 700 /mnt/persist/system/root
sudo mkdir -p /mnt/persist/home
sudo mkdir -p -m 700 /mnt/persist/home/kieran
sudo mkdir -p /mnt/backup/system
sudo mkdir -p -m 700 /mnt/backup/system/root
sudo mkdir -p /mnt/backup/home
sudo mkdir -p -m 700 /mnt/backup/home/kieran

# Copy secret keys
sudo mkdir -p /mnt/persist/system/root/.config/sops/age
sudo cp /iso/config/install_scripts/neri.keys.txt /mnt/persist/system/root/.config/sops/age/keys.txt
sudo mkdir -p /mnt/persist/home/kieran/.config/sops/age
sudo cp /iso/config/install_scripts/kieran.keys.txt /mnt/persist/home/kieran/.config/sops/age/keys.txt
sudo chown -R 1000:100 /mnt/persist/home/kieran # kieran:users
# Also copy secret to current environment because nixos-install doesn't check from specified root location
sudo mkdir -p /persist/system/root/.config/sops/age
sudo cp /iso/config/install_scripts/neri.keys.txt /persist/system/root/.config/sops/age/keys.txt

# Done
echo ""
echo "DISK SETUP COMPLETE -------------------------------------------------------------------"
echo "Please add a line to hardware-configuration.nix to open crypt2 at boot"
