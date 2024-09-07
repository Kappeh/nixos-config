#!/usr/bin/env bash
# set_bg.sh

set -euo pipefail

if (( $# > 1 )); then
    echo "Error: Unexpected argument" >&2
    exit 1
fi

BACKGROUND_PATH="$HOME/Pictures/.background"

if [ $# -eq 1 ]; then
    IMAGE_PATH="$1"

    if [ ! -f "$IMAGE_PATH" ]; then
        echo "Error: Provided path is not a valid file" >&2
        exit 1
    fi

    cp $IMAGE_PATH $BACKGROUND_PATH

    if [ $? -ne 0 ]; then
        echo "Error: Could not copy the image to $BACKGROUND_PATH" >&2
        exit 1
    fi
fi

if [ ! -f "$BACKGROUND_PATH" ]; then
    echo "Error: No image found at $BACKGROUND_PATH to set as background" >&2
    exit 1
fi

feh --bg-fill "$BACKGROUND_PATH"
