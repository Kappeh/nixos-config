{ config, lib, ... }: {
  imports = [
    ./duplicati/default.nix
    ./illegal_crime_mc/default.nix
    ./jellyfin/default.nix
    ./navidrome/default.nix
    ./project_zomboid/default.nix
    ./services/default.nix
    ./synapse/default.nix
    ./syncthing/default.nix
  ];

  options.myModules.users.system.enable = lib.mkEnableOption "Enable system users";

  config.myModules.users.system = {
    duplicati.enable = lib.mkDefault config.myModules.users.system.enable;
    illegal_crime_mc.enable = lib.mkDefault config.myModules.users.system.enable;
    jellyfin.enable = lib.mkDefault config.myModules.users.system.enable;
    navidrome.enable = lib.mkDefault config.myModules.users.system.enable;
    project_zomboid.enable = lib.mkDefault config.myModules.users.system.enable;
    services.enable = lib.mkDefault config.myModules.users.system.enable;
    synapse.enable = lib.mkDefault config.myModules.users.system.enable;
    syncthing.enable = lib.mkDefault config.myModules.users.system.enable;
  };
}
