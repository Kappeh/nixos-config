{ config, ... }: {
  config = {
    services.syncthing.enable = true;

    home.persistence."/persist/home/kieran".directories = [
      "Sync"
      ".local/state/syncthing"
    ];
  };
}
