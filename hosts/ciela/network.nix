{
  config = {
    networking = {
      hostName = "ciela";

      networkmanager.enable = true;
    };

    environment.persistence."/persist/system".directories = [
      "/etc/NetworkManager"
      "/var/lib/NetworkManager"
    ];
  };
}

