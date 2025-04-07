#!/usr/bin/env bash
# run_backup.sh
#
# This script performs a backup of a specified Btrfs subvolume.
#
# The backup process involves the following steps:
# 1. Create a read-only snapshot of the subvolume defined by `SOURCE_SUBVOL_PATH`.
# 2. Store this snapshot within the subvolume specified by `SNAPSHOT_STORAGE_PATH`.
# 3. Copy the snapshot from `SNAPSHOT_STORAGE_PATH` to a designated backup location specified by `BACKUP_DESTINATION_PATH`.

set -eu

# Ensure the script is executed with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Error: This script must be run as root." >&2
  exit 1
fi

# Path to the Btrfs subvolume that needs to be backed up
SOURCE_SUBVOL_PATH="/backup"
# Path to the Btrfs subvolume where the snapshot will be created
SNAPSHOT_STORAGE_PATH="/snapshots"
# Path to the location where the snapshot will be copied for long-term storage
BACKUP_DESTINATION_PATH="/backups"
# Path to the symlink pointing to the latest snapshot
LATEST_SNAPSHOT_SYMLINK="${SNAPSHOT_STORAGE_PATH}/backup_latest"
# The number of snapshots to keep
SNAPSHOTS_TO_KEEP=12

# Generate a timestamp for the backup
BACKUP_TIMESTAMP=$(date +"%Y_%m_%d_%H_%M_%S")
BACKUP_NAME="backup_${BACKUP_TIMESTAMP}"
SNAPSHOT_PATH="${SNAPSHOT_STORAGE_PATH}/${BACKUP_NAME}"

if [ ! -e "$LATEST_SNAPSHOT_SYMLINK" ]; then
    echo "Info: Previous backup not found. Performing a full backup."

    btrfs subvolume snapshot -r "$SOURCE_SUBVOL_PATH" "$SNAPSHOT_PATH"
    btrfs send "$SNAPSHOT_PATH" | btrfs receive "$BACKUP_DESTINATION_PATH"
    ln -s "$SNAPSHOT_PATH" "$LATEST_SNAPSHOT_SYMLINK"

    exit 0
fi

if [ ! -L "$LATEST_SNAPSHOT_SYMLINK" ]; then
    echo "Error: The path '${LATEST_SNAPSHOT_SYMLINK}' is not a symlink." >&2
    exit 1
fi

# Resolve the absolute path of the latest snapshot
LATEST_SNAPSHOT_PATH=$(readlink -f "$LATEST_SNAPSHOT_SYMLINK")

# Check if the path is a directory
if [ ! -d "$LATEST_SNAPSHOT_PATH" ]; then
    echo "Error: The path '${LATEST_SNAPSHOT_PATH}' does not exist or is not a directory." >&2
    exit 1
fi

# Check if the directory is a Btrfs subvolume
# Subvolumes in Btrfs typically have an inode number of 256. This should be adjusted if necessary.
if [ "$(stat --format=%i "$LATEST_SNAPSHOT_PATH")" -ne 256 ]; then
    echo "Error: The directory '${LATEST_SNAPSHOT_PATH}' is not a Btrfs subvolume." >&2
    exit 1
fi

echo "Info: Found previous backup. Performing an incremental backup."

btrfs subvolume snapshot -r "$SOURCE_SUBVOL_PATH" "$SNAPSHOT_PATH"
btrfs send -p "$LATEST_SNAPSHOT_PATH" "$SNAPSHOT_PATH" | btrfs receive "$BACKUP_DESTINATION_PATH"
rm "$LATEST_SNAPSHOT_SYMLINK"
ln -s "$SNAPSHOT_PATH" "$LATEST_SNAPSHOT_SYMLINK"

# Remove old snapshots
delete_subvolume_recursively() {
    IFS=$'\n'
    for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
        delete_subvolume_recursively "/btrfs_tmp/$i"
    done
    btrfs subvolume delete "$1"
}

SNAPSHOTS=$(find "$SNAPSHOT_STORAGE_PATH" -mindepth 1 -maxdepth 1 -type d)
TOTAL_SNAPSHOTS=$(echo "$SNAPSHOTS" | wc -l)

echo "TOTAL_SNAPSHOTS: $TOTAL_SNAPSHOTS, SNAPSHOTS_TO_KEEP: $SNAPSHOTS_TO_KEEP"

if ((TOTAL_SNAPSHOTS > SNAPSHOTS_TO_KEEP)); then
    SNAPSHOTS_TO_REMOVE=$((TOTAL_SNAPSHOTS - SNAPSHOTS_TO_KEEP))
    SNAPSHOTS_TO_DELETE=$(echo "$SNAPSHOTS" | head -n "$SNAPSHOTS_TO_REMOVE")
    for SNAPSHOT in $SNAPSHOTS_TO_DELETE; do
        echo "Removing snapshot $SNAPSHOT"
        delete_subvolume_recursively "$SNAPSHOT"
    done
fi
