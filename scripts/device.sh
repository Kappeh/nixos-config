#!/usr/bin/env bash
# device.sh

set -e

print_usage () {
  echo "Usage: $(basename $0) [OPTIONS]... OPERATION DEVICE"
  echo "    -h, --help       show help"
  echo "OPERATION"
  echo "    mount"
  echo "    umount"
  echo "DEVICE"
  echo "    keylogger"
  echo "    spyware"
  echo "    t7_2"
}

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      print_usage
      exit 0
      ;;
    -*|--*)
      echo "Unknown option $1"
      print_usage
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1")
      shift
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}"

if [[ -z $1 ]] || [[ -z $2 ]]; then
  print_usage
  exit 1
fi

OPERATION=$1
DEVICE_NAME=$2

DEVICE_ID=""
MOUNT_NAME=""

case $DEVICE_NAME in
  keylogger)
    DEVICE_ID="usb-Generic_Flash_Disk_23081610370448-0:0-part1"
    MOUNT_NAME="keylogger"
    ;;
  spyware)
    DEVICE_ID="usb-Generic_Flash_Disk_23081610370096-0:0-part1"
    MOUNT_NAME="spyware"
    ;;
  t7_2)
    DEVICE_ID="usb-Samsung_PSSD_T7_S6XCNS0W818267V-0:0-part1"
    MOUNT_NAME="t7_2"
    ;;
  *)
    echo "Unknown device $DEVICE_NAME"
    print_usage
    exit 1
    ;;
esac

DEVICE="/dev/disk/by-id/$DEVICE_ID"
MOUNT_POINT="/mnt/$MOUNT_NAME"

case $OPERATION in
  mount)
    if [ -d $MOUNT_POINT ] && mountpoint $MOUNT_POINT > /dev/null; then
        echo "$MOUNT_POINT is already a mountpoint"
        exit 1
    fi

    sudo mkdir -p $MOUNT_POINT
    sudo mount -o uid=$(id -u kieran),gid=$(id -g kieran) $DEVICE $MOUNT_POINT

    echo "Mounted $DEVICE_NAME at $MOUNT_POINT"
    ;;
  umount)
    if [ ! -d $MOUNT_POINT ] || ! mountpoint $MOUNT_POINT > /dev/null; then
        echo "$MOUNT_POINT is not a mountpoint"
        exit 1
    fi

    sudo umount $MOUNT_POINT

    echo "Unmounted $DEVICE_NAME from $MOUNT_POINT"
    ;;
  *)
    echo "Unknown operation $OPERATION"
    print_usage
    exit 1
    ;;
esac
