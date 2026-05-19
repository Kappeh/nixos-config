{ lib, config, ... }: {
  options.myModules.virtualisation.docker.enable = lib.mkEnableOption "Enable Docker";

  config = lib.mkIf config.myModules.virtualisation.docker.enable {
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
