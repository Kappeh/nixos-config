{ config, ... }: {
  config = {
    networking.networkmanager.enable = true;

    environment.persistence."/persist/system".directories = [
      {
        directory = "/etc/NetworkManager/system-connections";
        mode = "0700";
      }
    ];
  };
}
