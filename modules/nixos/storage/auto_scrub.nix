{ config, lib, ... }: {
  options.kappeh.storage.auto_scrub.enable = lib.mkEnableOption "Enable auto scrub";

  config = lib.mkIf config.kappeh.storage.auto_scrub.enable {
    services.btrfs.autoScrub = {
      enable = true;
      interval = "monthly";
      fileSystems = [ "/mnt/btrfs_root" ];
    };

    environment.persistence."/persist/system".directories = [
      "/var/lib/btrfs"
    ];
  };
}

