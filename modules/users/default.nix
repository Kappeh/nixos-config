{ config, lib, ... }: {
  imports = [
    ./duplicati.nix
    ./freshrss.nix
    ./illegal_crime_mc.nix
    ./jellyfin.nix
    ./kieran.nix
    ./navidrome.nix
    ./project_zomboid.nix
    ./services.nix
    ./synapse.nix
    ./syncthing.nix
  ];

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

  options.myModules.users = {
    normal.enable = lib.mkEnableOption "Enable normal users";
    system.enable = lib.mkEnableOption "Enable system users";
  };

  config.myModules.users = {
    normal.enable = lib.mkDefault true;
    system.enable = lib.mkDefault false;

    normal.kieran.enable = lib.mkDefault config.myModules.users.normal.enable;

    system = {
      duplicati.enable = lib.mkDefault config.myModules.users.system.enable;
      freshrss.enable = lib.mkDefault config.myModules.users.system.enable;
      illegal_crime_mc.enable = lib.mkDefault config.myModules.users.system.enable;
      jellyfin.enable = lib.mkDefault config.myModules.users.system.enable;
      navidrome.enable = lib.mkDefault config.myModules.users.system.enable;
      project_zomboid.enable = lib.mkDefault config.myModules.users.system.enable;
      services.enable = lib.mkDefault config.myModules.users.system.enable;
      synapse.enable = lib.mkDefault config.myModules.users.system.enable;
      syncthing.enable = lib.mkDefault config.myModules.users.system.enable;
    };
  };
}
