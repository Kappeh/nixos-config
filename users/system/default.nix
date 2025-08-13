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

  config = lib.mkIf config.myModules.users.system.enable {
    myModules.users.system = {
      duplicati.enable = lib.mkDefault true;
      illegal_crime_mc.enable = lib.mkDefault true;
      jellyfin.enable = lib.mkDefault true;
      navidrome.enable = lib.mkDefault true;
      project_zomboid.enable = lib.mkDefault true;
      services.enable = lib.mkDefault true;
      synapse.enable = lib.mkDefault true;
      syncthing.enable = lib.mkDefault true;
    };
  };
}
