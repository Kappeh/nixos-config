{ config, lib, ... }: {
  options.myModules.core.syncthing.enable = lib.mkEnableOption "Enable Syncthing";

  config = lib.mkIf config.myModules.core.syncthing.enable {
    services.syncthing.enable = true;

    home.persistence."/persist/home/${config.home.username}".directories = [
      "Sync"
      ".local/state/syncthing"
    ];
  };
}
