{
  config = {
    boot.initrd = {
      availableKernelModules = [
        "ahci"
        "usb_storage"
        "sd_mod"
        "xhci_pci"
        "ehci_pci"
        "usbhid"
      ];

      luks.devices = {
        "crypt2" = {
          device = "/dev/disk/by-uuid/9d2c4603-4870-47f5-b70c-28a56ba30750";
          allowDiscards = true;
          bypassWorkqueues = true;
        };
        "crypt3" = {
          device = "/dev/disk/by-uuid/ff906e8c-0e85-429f-b769-966b7fb0b5c7";
          allowDiscards = true;
          bypassWorkqueues = true;
        };
      };
    };

    fileSystems = {
      "/boot" = {
        device = "/dev/disk/by-uuid/1981-9A38";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
      };
      "/" = {
        device = "none";
        fsType = "tmpfs";
        options = [ "size=2G" "mode=755" ];
      };
      "/mnt/btrfs_root" = {
        device = "/dev/disk/by-uuid/28f5a0a0-e0b2-4886-8f63-05ac1ee87dcb";
        fsType = "btrfs";
        options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      };
      "/persist" = {
        device = "/dev/disk/by-uuid/28f5a0a0-e0b2-4886-8f63-05ac1ee87dcb";
        fsType = "btrfs";
        options = [ "subvol=persist" "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
        neededForBoot = true;
      };
      "/nix" = {
        device = "/dev/disk/by-uuid/28f5a0a0-e0b2-4886-8f63-05ac1ee87dcb";
        fsType = "btrfs";
        options = [ "subvol=nix" "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      };
      "/var/log" = {
        device = "/dev/disk/by-uuid/28f5a0a0-e0b2-4886-8f63-05ac1ee87dcb";
        fsType = "btrfs";
        options = [ "subvol=log" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
        neededForBoot = true;
      };
    };
  };
}

