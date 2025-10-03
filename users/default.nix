{ config, lib, ... }: {
  imports = [
    ./normal/default.nix
    ./system/default.nix
  ];

  config.myModules.users = {
    normal.enable = lib.mkDefault true;
    system.enable = lib.mkDefault false;
  };

  # TODO: fix these user and group ids

  # 400:  project_zomboid
  # 500:  illegal_crime_mc
  # 501:  syncthing
  # 502:  duplicati
  # 503:  synapse
  # 504:  navidrome
  # 505:  freshrss

  # 1000: kieran
  # 1001: services

  # 1002: jellyfin
}
