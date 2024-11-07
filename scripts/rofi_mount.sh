#!/usr/bin/env bash
# rofi_mount.sh

FS_LABELS=$(lsblk --paths --list --output name,label)
PART_LABELS=$(lsblk --paths --list --output name,partlabel)

DEVICES=""

while read DEVICE; do
    # Get device info from udisks
    UDISKS_INFO=$(udisksctl info -b $DEVICE)

    # Check if device is a filesystem or encrypted volume
    ID_USAGE=$(echo -e "$UDISKS_INFO" | grep "IdUsage" | awk '{print $2}')
    if [[ "$ID_USAGE" != "filesystem" ]] && [[ "$ID_USAGE" != "crypto" ]]; then
        continue
    fi

    # Filter devices to unmounted filesystem and locked crypto devices
    if [[ "$ID_USAGE" == "crypto" ]]; then
        # If the device is a crypto device, check if it is unlocked and mapped
        CLEARTEXT_DEVICE=$(echo -e "$UDISKS_INFO" | grep "CleartextDevice" | awk '{print $2}')
        if [[ -n "$CLEARTEXT_DEVICE" ]] && [[ "$CLEARTEXT_DEVICE" != "'/'" ]]; then
            continue
        fi
    elif [[ "$ID_USAGE" == "filesystem" ]]; then
        # If the device is a filesystem device, check if it is mounted
        MOUNT_POINTS=$(echo -e "$UDISKS_INFO" | grep "MountPoints" | awk '{print $2}')
        if [[ -n "$MOUNT_POINTS" ]]; then
            continue
        fi
    else
        continue
    fi

    # Get filesystem and partition labels for device
    FS_LABEL=$(echo -e "$FS_LABELS" | grep "$DEVICE " | awk '{print $2}')
    PART_LABEL=$(echo -e "$PART_LABELS" | grep "$DEVICE " | awk '{print $2}')

    # Add entry to rofi list
    if [ -n "${FS_LABEL// }" ]; then
        DEVICES="$DEVICES$DEVICE <i>$ID_USAGE ($FS_LABEL)</i>\n"
    elif [ -n "${PART_LABEL// }" ]; then
        DEVICES="$DEVICES$DEVICE <i>$ID_USAGE ($PART_LABEL)</i>\n"
    else
        DEVICES="$DEVICES$DEVICE <i>$ID_USAGE</i>\n"
    fi
done <<< $(lsblk --paths --list --output name | tail -n +2)

# Prompt user for which device to mount
SELECTED=$(echo -ne "$DEVICES" | rofi -dmenu -p mount -i -no-custom -markup-rows)
# Exit if the user cancelled the selection
if [ $? -eq 1 ]; then
    exit 0
fi
# Extract only the device path out of the selection string
SELECTED=$(echo $SELECTED | cut -d ' ' -f1)

ID_USAGE=$(udisksctl info -b $SELECTED | grep IdUsage | awk '{print $2}')
FILESYSTEM_PATH=""

if [ $ID_USAGE = "crypto" ]; then
    # Prompt user for password
    PASSWORD=$(rofi -dmenu -p password -password -l 0 -mesg "Enter password to unlock $SELECTED_LABEL")
    # Exit if user cancelled selection
    if [ $? -eq 1 ]; then
        exit 0
    fi

    # Try unlocking the device
    UDISKSCTL_OUTPUT=$(udisksctl unlock -b $SELECTED --key-file <(echo -n $PASSWORD) 2>&1)
    # Exit if the device unlocking failed
    if [ $? -ne 0 ]; then
        rofi -e "$UDISKSCTL_OUTPUT"
        exit 1
    fi

    # Extract cleartext device from udisksctl output
    CLEARTEXT_DEVICE=$(echo $UDISKSCTL_OUTPUT | awk '{print $NF}' | sed 's/\.//g')
    # Check if the cleartext device is a mountable filesystem
    UDISKS_INFO=$(udisksctl info -b $CLEARTEXT_DEVICE)
    ID_USAGE=$(echo -e "$UDISKS_INFO" | grep "IdUsage" | awk '{print $2}')
    if [[ "$ID_USAGE" != "filesystem" ]]; then
        exit 0
    fi

    FS_LABEL=$(lsblk --paths --list --output name,label $CLEARTEXT_DEVICE | tail -n +2 | awk '{print $2}')
    PART_LABEL=$(lsblk --paths --list --output name,partlabel $CLEARTEXT_DEVICE | tail -n +2 | awk '{print $2}')

    FILESYSTEM=""
    if [ -n "${FS_LABEL// }" ]; then
        FILESYSTEM="$CLEARTEXT_DEVICE <i>($FS_LABEL)</i>"
    elif [ -n "${PART_LABEL// }" ]; then
        FILESYSTEM="$CLEARTEXT_DEVICE <i>($PART_LABEL)</i>"
    else
        FILESYSTEM="$CLEARTEXT_DEVICE"
    fi

    SHOULD_MOUNT=$(echo -en "yes\nno" | rofi -dmenu -l 2 -p mount -i -only-match -mesg "Would you like to mount ${FILESYSTEM}")

    if [ "$SHOULD_MOUNT" == "yes" ]; then
        rofi -e "$(udisksctl mount -b $CLEARTEXT_DEVICE 2>&1)"
    fi
elif [ $ID_USAGE = "filesystem" ]; then
    rofi -e "$(udisksctl mount -b $SELECTED --no-user-interaction 2>&1)"
else
    rofi -e "Error: Unknown IdUsage for device"
    exit 1
fi
