#!/usr/bin/env bash
set -euo pipefail

# Check if the script is being run as root
if [[ "$EUID" -ne 0 ]]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# Find all mount points below /, except / itself.
mapfile -t mounts < <(
    findmnt --list -Rno TARGET / | tail -n +2
)

# Build a find expression which prunes every mount point.
args=(/)

for mount in "${mounts[@]}"; do
    args+=(-path "$mount" -prune -o)
done

# Everything that survives the pruning is on the root filesystem.
args+=(-type f -print)

find "${args[@]}"

