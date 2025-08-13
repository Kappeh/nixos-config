{ config, lib, osConfig, ... }: {
  options.myModules.core.syncthing.enable = lib.mkEnableOption "Enable Syncthing";

  config = lib.mkIf config.myModules.core.syncthing.enable {
    services.syncthing.enable = true;

    home.persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [
        "Sync"
        ".local/state/syncthing"
      ];
    };
  };
}
