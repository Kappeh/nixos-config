{
  config = {
    boot = {
      kernelModules = [ "kvm-intel" ];
      initrd = {
        availableKernelModules = [
          "xhci_pci"
          "thunderbolt"
          "nvme"
        ];
        luks.devices."crypt" = {
          device = "/dev/disk/by-uuid/467c41dd-70cf-49ce-b2e7-af51d653e054";
          allowDiscards = true;
          bypassWorkqueues = true;
        };
      };
      resumeDevice = "/dev/mapper/crypt";
      kernelParams = [ "resume_offset=33301760" ];
    };

    fileSystems = {
      "/boot" = {
        device = "/dev/disk/by-uuid/0833-0BF6";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
      };
      "/" = {
        device = "none";
        fsType = "tmpfs";
        options = [ "size=2G" "mode=755" ];
      };
      "/mnt/btrfs_root" = {
        device = "/dev/mapper/crypt";
        fsType = "btrfs";
        options = [ "subvolid=5" "noatime" "compress=zstd:1" "discard=async" ];
      };
      "/persist" = {
        device = "/dev/mapper/crypt";
        fsType = "btrfs";
        options = [ "subvol=persist" "noatime" "compress=zstd:1" "discard=async" ];
        neededForBoot = true;
      };
      "/nix" = {
        device = "/dev/mapper/crypt";
        fsType = "btrfs";
        options = [ "subvol=nix" "noatime" "compress=zstd:1" "discard=async" ];
      };
      "/var/log" = {
        device = "/dev/mapper/crypt";
        fsType = "btrfs";
        options = [ "subvol=log" "relatime" "compress=zstd:1" "discard=async" ];
        neededForBoot = true;
      };
    };

    swapDevices = [
      {
        device = "/mnt/btrfs_root/swap/swapfile";
        size = 24 * 1024;
      }
    ];
  };
}

