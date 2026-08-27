{
  config = {
    environment.persistence."/persist/system".directories = [ "/mnt/" ];

    fileSystems = {
      "/backup" = {
        options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
        neededForBoot = true;
      };
      "/persist" = {
        options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
        neededForBoot = true;
      };
      "/nix".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/partition_root".options = [ "noatime" "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
      "/var/log" = {
        options = [ "compress=zstd:1" "discard=async" "ssd" "space_cache=v2" ];
        neededForBoot = true;
      };
    };

    services.btrfs.autoScrub = {
      enable = true;
      interval = "monthly";
      fileSystems = [ "/partition_root" ];
    };
  };
}

