#!/usr/bin/env bash
# fs_diff.sh

set -euo pipefail

# Ensure the script is executed with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Error: This script must be run as root." >&2
  exit 1
fi

OLD_TRANSID=$(sudo btrfs subvolume find-new /raid_root/root_blank 9999999)
OLD_TRANSID=${OLD_TRANSID#transid marker was }

btrfs subvolume find-new "/raid_root/root" "$OLD_TRANSID" |
sed '$d' |
cut -f17- -d' ' |
sort |
uniq |
while read path; do
  path="/$path"
  if [ -L "$path" ]; then
    : # The path is a symbolic link, so is probably handled by NixOS already
  elif [ -d "$path" ]; then
    : # The path is a directory, ignore
  else
    echo "$path"
  fi
done
