{ config, ... }: {
  config = {
    virtualisation.docker = {
      enable = true;
      storageDriver = "btrfs";
    };

    environment.persistence."/persist/system".directories = [
      {
        directory = "/var/lib/docker";
        mode = "0710";
      }
    ];
  };
}
