{ lib, ... }: {
  imports = [
    ./portainer.nix
  ];

  config = {
    myModules.containers = {
      portainer.enable = lib.mkDefault false;
    };

    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
      logDriver = "journald";
      storageDriver = "btrfs";
    };

    virtualisation.oci-containers.backend = "docker";

    environment.persistence."/persist/system".directories = [{
      directory = "/var/lib/docker";
      mode = "710";
    }];
  };
}
