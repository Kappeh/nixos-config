# initExtra.sh
SEQUENCE_FILE="$HOME/.cache/wal/sequences"

if [[ -f "$SEQUENCE_FILE" ]]; then
    cat $SEQUENCE_FILE
fi
