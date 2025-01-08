#!/usr/bin/env bash

set -e

BACKUPS_TO_KEEP=24
BACKUPS_PATH="/services/mc_server/backups"
MAIN_WORLDS_SRC="/services/mc_server/mc_server_main/data"
G4MESPEED_WORLDS_SRC="/services/mc_server/mc_server_g4mespeed/data"

BACKUP_NAME=$(date +"%Y_%m_%d_%H_%M_%S")
BACKUP_PATH="$BACKUPS_PATH/$BACKUP_NAME"
MAIN_WORLDS_DEST="$BACKUP_PATH/main/worlds"
G4MESPEED_WORLDS_DEST="$BACKUP_PATH/g4mespeed/worlds"

# Create destination directories for backups
mkdir -p "$MAIN_WORLDS_DEST" "$G4MESPEED_WORLDS_DEST"

# Announce backup is starting
docker exec -i mc_server_main rcon-cli "tellraw @a [{\"text\":\"Server\",\"color\":\"light_purple\"},{\"text\":\": Backup is starting\",\"color\":\"white\"}]"
docker exec -i mc_server_g4mespeed rcon-cli "tellraw @a [{\"text\":\"Server\",\"color\":\"light_purple\"},{\"text\":\": Backup is starting\",\"color\":\"white\"}]"

# Disable autosaving
docker exec -i mc_server_main rcon-cli save-off
docker exec -i mc_server_g4mespeed rcon-cli save-off

# Manually save worlds
docker exec -i mc_server_main rcon-cli save-all
docker exec -i mc_server_g4mespeed rcon-cli save-all

# Make a copies of worlds while autosaving is disabled
cp -r "$MAIN_WORLDS_SRC/survival" "$MAIN_WORLDS_DEST/"
cp -r "$MAIN_WORLDS_SRC/survival_nether" "$MAIN_WORLDS_DEST/"
cp -r "$MAIN_WORLDS_SRC/survival_the_end" "$MAIN_WORLDS_DEST/"
cp -r "$MAIN_WORLDS_SRC/creative" "$MAIN_WORLDS_DEST/"
cp -r "$MAIN_WORLDS_SRC/creative_nether" "$MAIN_WORLDS_DEST/"

cp -r "$G4MESPEED_WORLDS_SRC/world" "$G4MESPEED_WORLDS_DEST/"

# Enable autosaving
docker exec -i mc_server_main rcon-cli save-on
docker exec -i mc_server_g4mespeed rcon-cli save-on

# Announce backup is complete
docker exec -i mc_server_main rcon-cli "tellraw @a [{\"text\":\"Server\",\"color\":\"light_purple\"},{\"text\":\": Backup is complete\",\"color\":\"white\"}]"
docker exec -i mc_server_g4mespeed rcon-cli "tellraw @a [{\"text\":\"Server\",\"color\":\"light_purple\"},{\"text\":\": Backup is complete\",\"color\":\"white\"}]"

# Create/update symlink which points to latest backup
LATEST_SYMLINK="$BACKUPS_PATH/markers/latest"

if [ -L "$LATEST_SYMLINK" ]; then
	# Symlink exists. Updating it.
	rm "$LATEST_SYMLINK"
	ln -s "../$BACKUP_NAME" "$LATEST_SYMLINK"
elif [ -e "$LATEST_SYMLINK" ]; then
	# File exists but it's not a symlink.
	rm -f "$LATEST_SYMLINK"
	ln -s "../$BACKUP_NAME" "$LATEST_SYMLINK"
else
	# Symlink does not exists. Creating it.
	ln -s "../$BACKUP_NAME" "$LATEST_SYMLINK"
fi

# Remove old backups
BACKUP_DIRS=$(find "$BACKUPS_PATH" -mindepth 1 -maxdepth 1 -type d ! -name "markers" | sort)
TOTAL_BACKUPS=$(echo "$BACKUP_DIRS" | wc -l)

echo "TOTAL_BACKUPS: $TOTAL_BACKUPS, BACKUPS_TO_KEEP: $BACKUPS_TO_KEEP"

if ((TOTAL_BACKUPS > BACKUPS_TO_KEEP)); then
	BACKUPS_TO_REMOVE=$((TOTAL_BACKUPS - BACKUPS_TO_KEEP))
	BACKUPS_TO_DELETE=$(echo "$BACKUP_DIRS" | head -n "$BACKUPS_TO_REMOVE")
	for BACKUP in $BACKUPS_TO_DELETE; do
		echo "Removing $BACKUP"
		rm -r "$BACKUP"
	done
fi
