#!/usr/bin/env bash

set -e

PROJECT_DIR="/services/illegal_crime_mc"
BACKUPS_DIR_HOST="$PROJECT_DIR/backups"
BACKUPS_TO_KEEP=24

PUID=500  # illegal_crime_mc
PGID=1001 # services

# Create backup directory
DATE="$(date +\%Y-\%m-\%d_\%H-\%M-\%S)"
BACKUP_DIR_HOST="$BACKUPS_DIR_HOST/$DATE"

mkdir -p "$BACKUP_DIR_HOST"
mkdir -p "$BACKUP_DIR_HOST/fabric/data"
mkdir -p "$BACKUP_DIR_HOST/paper/data"
mkdir -p "$BACKUP_DIR_HOST/paper/data/plugins/Multiverse-Core"
mkdir -p "$BACKUP_DIR_HOST/paper/data/plugins/Multiverse-Inventories"
mkdir -p "$BACKUP_DIR_HOST/velocity/data/plugins/dclink-velocity"

chown -R "$PUID:$PGID" "$BACKUP_DIR_HOST"
chmod -R 770 "$BACKUP_DIR_HOST"

# Announce backup is starting
docker exec illegal_crime_fabric rcon-cli "tellraw @a [{\"text\":\"Server\",\"color\":\"light_purple\"},{\"text\":\": Backup is starting\",\"color\":\"white\"}]"
docker exec illegal_crime_paper rcon-cli "tellraw @a [{\"text\":\"Server\",\"color\":\"light_purple\"},{\"text\":\": Backup is starting\",\"color\":\"white\"}]"

# Disable autosaving
docker exec illegal_crime_fabric rcon-cli save-off
docker exec illegal_crime_paper rcon-cli save-off

# Manually save to ensure recent changes are included in backup
docker exec illegal_crime_fabric rcon-cli save-all
docker exec illegal_crime_paper rcon-cli save-all

# Dump luckperms database
PG_USER="luckperms"
PG_DB="luckperms"
BACKUP_DIR_CONTAINER="/backups/$DATE"
docker exec illegal_crime_luckperms_db pg_dump -U "$PG_USER" -F c -b -v -f "$BACKUP_DIR_CONTAINER/luckperms.sql" "$PG_DB"

# Copy WorldEdit schematics
cp -r "$PROJECT_DIR/schematics" "$BACKUP_DIR_HOST/"

# Copy dclink database
cp "$PROJECT_DIR/velocity/data/plugins/dclink-velocity/dclink.db" "$BACKUP_DIR_HOST/velocity/data/plugins/dclink-velocity/"

# Copy Multiverse files
cp -r "$PROJECT_DIR/paper/data/plugins/Multiverse-Core/worlds.yml" "$BACKUP_DIR_HOST/paper/data/plugins/Multiverse-Core/"
cp -r "$PROJECT_DIR/paper/data/plugins/Multiverse-Inventories/groups.yml" "$BACKUP_DIR_HOST/paper/data/plugins/Multiverse-Inventories/"
cp -r "$PROJECT_DIR/paper/data/plugins/Multiverse-Inventories/groups" "$BACKUP_DIR_HOST/paper/data/plugins/Multiverse-Inventories/"
cp -r "$PROJECT_DIR/paper/data/plugins/Multiverse-Inventories/players" "$BACKUP_DIR_HOST/paper/data/plugins/Multiverse-Inventories/"
cp -r "$PROJECT_DIR/paper/data/plugins/Multiverse-Inventories/worlds" "$BACKUP_DIR_HOST/paper/data/plugins/Multiverse-Inventories/"

# Copy G4mespeed files
cp -r "$PROJECT_DIR/fabric/data/g4mespeed" "$BACKUP_DIR_HOST/fabric/data"

# Copy Minecraft worlds
cp -r "$PROJECT_DIR/fabric/data/world" "$BACKUP_DIR_HOST/fabric/data/"
cp -r "$PROJECT_DIR/paper/data/survival" "$BACKUP_DIR_HOST/paper/data/"
cp -r "$PROJECT_DIR/paper/data/survival_nether" "$BACKUP_DIR_HOST/paper/data/"
cp -r "$PROJECT_DIR/paper/data/survival_the_end" "$BACKUP_DIR_HOST/paper/data/"

# Enable autosaving
docker exec illegal_crime_fabric rcon-cli save-on
docker exec illegal_crime_paper rcon-cli save-on

# Announce backup is complete
docker exec illegal_crime_fabric rcon-cli "tellraw @a [{\"text\":\"Server\",\"color\":\"light_purple\"},{\"text\":\": Backup is complete\",\"color\":\"white\"}]"
docker exec illegal_crime_paper rcon-cli "tellraw @a [{\"text\":\"Server\",\"color\":\"light_purple\"},{\"text\":\": Backup is complete\",\"color\":\"white\"}]"

# Create or update symlink pointing to latest backup
mkdir -p "$BACKUPS_DIR_HOST/markers"
LATEST_SYMLINK="$BACKUPS_DIR_HOST/markers/latest"
if [ -L "$LATEST_SYMLINK" ]; then
    # Symlink exists. Updating it.
    rm "$LATEST_SYMLINK"
    ln -s "../$DATE" "$LATEST_SYMLINK"
elif [ -e "$LATEST_SYMLINK" ]; then
    # File exists but it's not a symlink.
    rm -f "$LATEST_SYMLINK"
    ln -s "../$DATE" "$LATEST_SYMLINK"
else
    # Symlink does not exists. Creating it.
    ln -s "../$DATE" "$LATEST_SYMLINK"
fi

# Remove old backups
BACKUP_DIRS=$(find "$BACKUPS_DIR_HOST" -mindepth 1 -maxdepth 1 -type d ! -name "markers" | sort)
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

# Update permissions of backed up files
chown -R "$PUID:$PGID" "$BACKUPS_DIR_HOST"
chmod -R 770 "$BACKUPS_DIR_HOST"
