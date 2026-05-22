{ ... }: {
  config = {
    environment.persistence."/persist/system".directories = [ "/mnt/" ];

    fileSystems."/mnt/music_library_1" = {
      device = "omv.home.kappeh.org:/export/music-library-1";
      fsType = "nfs";
      options = [
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
      ];
    };

    fileSystems = {
      "/".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/backup".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/backups".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/persist".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/nix".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/raid_root".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/snapshots".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/swap".options = [ "noatime" "discard=async" "ssd" "space_cache=v2" ];
      "/var/log" = {
        options = [ "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
        neededForBoot = true;
      };
    };

    services.btrfs.autoScrub = {
      enable = true;
      interval = "monthly";
      fileSystems = [ "/raid_root" ];
    };
  };
}
