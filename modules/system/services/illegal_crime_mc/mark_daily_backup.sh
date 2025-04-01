#!/usr/bin/env bash

set -e

PROJECT_DIR="/services/illegal_crime_mc"
BACKUPS_DIR="$PROJECT_DIR/backups"
MARKERS_DIR="$BACKUPS_DIR/markers"
LATEST_SYMLINK="$MARKERS_DIR/latest"
DAILY_SYMLINK="$MARKERS_DIR/daily"

PUID=500  # illegal_crime_mc
PGID=1001 # services

# There is no latest backup, exit
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

# Update permissions of markers
chown -R "$PUID:$PGID" "$MARKERS_DIR"
chmod -R 770 "$MARKERS_DIR"
