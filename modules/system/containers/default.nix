{ ... }: {
  config = {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
      logDriver = "journald";
      storageDriver = "overlay2";
    };

    environment.persistence."/persist/system".directories = [{
      directory = "/var/lib/docker";
      mode = "710";
    }];
  };
}
