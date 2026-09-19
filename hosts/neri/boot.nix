{ pkgs, ... }: {
  config.boot = {
    initrd.luks.devices = {
      "crypt2" = {
        allowDiscards = true;
        bypassWorkqueues = true;
      };
      "crypt3" = {
        allowDiscards = true;
        bypassWorkqueues = true;
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "ntfs" "btrfs" ];
    tmp.cleanOnBoot = true;

    # Specify location of swapfile to use when attempting to resume during boot.
    # https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Manually_specify_hibernate_location
    # resumeDevice = "/dev/mapper/crypt1";
    # kernelParams = [ "resume_offset=56700969" ];

    # Used for building ARM NixOS images
    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };
}
