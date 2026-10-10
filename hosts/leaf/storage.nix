{
  config = {
    boot.initrd.availableKernelModules = [
      "uhci_hcd"
      "ehci_pci"
      "ahci"
      "xhci_pci"
      "virtio_pci"
      "virtio_scsi"
      "usb_storage"
      "sd_mod"
      "sr_mod"
    ];

    fileSystems = {
      "/boot" = {
        device = "/dev/disk/by-uuid/9A14-A718";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
      };
      "/" = {
        device = "/dev/disk/by-uuid/9a1b7eaf-4dc8-4883-9672-ae7fad712a9f";
        fsType = "btrfs";
        options = [ "subvol=root" ];
      };
      "/partition_root" = {
        device = "/dev/disk/by-uuid/9a1b7eaf-4dc8-4883-9672-ae7fad712a9f";
        fsType = "btrfs";
        options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      };
      "/backup" = {
        device = "/dev/disk/by-uuid/9a1b7eaf-4dc8-4883-9672-ae7fad712a9f";
        fsType = "btrfs";
        options = [ "subvol=backup" "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
        neededForBoot = true;
      };
      "/persist" = {
        device = "/dev/disk/by-uuid/9a1b7eaf-4dc8-4883-9672-ae7fad712a9f";
        fsType = "btrfs";
        options = [ "subvol=persist" "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
        neededForBoot = true;
      };
      "/nix" = {
        device = "/dev/disk/by-uuid/9a1b7eaf-4dc8-4883-9672-ae7fad712a9f";
        fsType = "btrfs";
        options = [ "subvol=nix" "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      };
      "/var/log" = {
        device = "/dev/disk/by-uuid/9a1b7eaf-4dc8-4883-9672-ae7fad712a9f";
        fsType = "btrfs";
        options = [ "subvol=log" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
        neededForBoot = true;
      };
    };

    kappeh.storage.auto_scrub.enable = true;
    services.btrfs.autoScrub.fileSystems = [ "/partition_root" ];
  };
}

