#!/usr/bin/env bash

set -e

BACKUPS_PATH="/services/mc_server/backups"
LATEST_SYMLINK="$BACKUPS_PATH/markers/latest"
DAILY_SYMLINK="$BACKUPS_PATH/markers/daily"

if [ ! -L "$LATEST_SYMLINK" ]; then
    exit 0
fi

if [ -L "$DAILY_SYMLINK" ]; then
	# Symlink exists. Updating it.
	rm "$DAILY_SYMLINK"
	cp -P "$LATEST_SYMLINK" "$DAILY_SYMLINK"
elif [ -e "$LATEST_SYMLINK" ]; then
	# File exists but it's not a symlink.
	rm -f "$DAILY_SYMLINK"
	cp -P "$LATEST_SYMLINK" "$DAILY_SYMLINK"
else
	# Symlink does not exists. Creating it.
	cp -P "$LATEST_SYMLINK" "$DAILY_SYMLINK"
fi
