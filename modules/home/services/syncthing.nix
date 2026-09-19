{ config, lib, ... }: {
  options.kappeh.services.syncthing.enable = lib.mkEnableOption "Enable Syncthing";

  config = lib.mkIf config.kappeh.services.syncthing.enable {
    home.persistence."/persist".directories = [
      "Sync"
      ".local/state/syncthing"
    ];

    services.syncthing.enable = true;
  };
}

