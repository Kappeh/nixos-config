{ config, lib, ... }: {
  options.kappeh.storage.btrbk.enable = lib.mkEnableOption "Enable btrbk snapshots";

  config = lib.mkIf config.kappeh.storage.btrbk.enable {
    services.btrbk.instances."local_snapshots" = {
      # Run every hour, accounting for daylight saving
      onCalendar = "*-*-* *:00:00 UTC";
      snapshotOnly = true;
      settings.volume."/mnt/btrfs_root" = {
        # Prevent ambiguous time stamps during daylight saving
        timestamp_format = "long-iso";
        snapshot_dir = "snapshots";
        snapshot_preserve = "24h 7d 4w 12m";
        snapshot_preserve_min = "latest";
        subvolume."persist".snapshot_create = "always";
      };
    };
  };
}

