{ lib, ... }: {
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount /dev/mapper/crypt1 /btrfs_tmp
    if [[ -e /btrfs_tmp/root ]]; then
      mkdir -p /btrfs_tmp/old_roots
      timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
      mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    fi

    delete_subvolume_recursively() {
      IFS=$'\n'
      for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
        delete_subvolume_recursively "/btrfs_tmp/$i"
      done
      btrfs subvolume delete "$1"
    }

    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
      delete_subvolume_recursively "$i"
    done

    if [[ -e /btrfs_tmp/root_blank ]]; then
      delete_subvolume_recursively /btrfs_tmp/root_blank
    fi

    btrfs subvolume create /btrfs_tmp/root
    btrfs subvolume snapshot -r /btrfs_tmp/root /btrfs_tmp/root_blank

    umount /btrfs_tmp
  '';

  environment.persistence."/persist/system" = {
    hideMounts = true;
    directories = [
      "/var/lib/nixos"                                                          # root:root 0755
      "/var/lib/systemd/coredump"                                               # root:root 0755
      "/var/lib/colord"                                                         # root:root 0755
      { directory = "/var/lib/bluetooth"; mode = "0700"; }                      # root:root 0700
      { directory = "/etc/NetworkManager/system-connections"; mode = "0700"; }  # root:root 0700
    ];
    files = [
      "/etc/machine-id"
      "/root/.config/sops/age/keys.txt"
    ];
  };

  systemd.tmpfiles.rules = [
    "d /persist/home/ 0755 root root -"
    "d /backup/home/ 0755 root root -"
    "d /persist/home/kieran 0700 kieran users -"
    "d /backup/home/kieran 0700 kieran users -"
    "d /persist/system/ 0755 root root -"
    "d /backup/system/ 0755 root root -"
    "d /persist/system/root 0700 root root -"
    "d /backup/system/root 0700 root root -"
  ];
}
