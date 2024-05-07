#!/usr/bin/env bash
# set-bg.sh

set -euo pipefail

BACKGROUND_PATH=$(realpath $1)

# Try to set the background
feh --no-fehbg --bg-fill $BACKGROUND_PATH

# Generate color scheme from background
wal -nqi $BACKGROUND_PATH

# Create / update file containing background image path
BACKGROUND_PATH_FILE="$HOME/.cache/background/path"
mkdir -p $(dirname $BACKGROUND_PATH_FILE)
echo $BACKGROUND_PATH > $BACKGROUND_PATH_FILE
