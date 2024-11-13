{ config, ... }: {
  config.virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
}
