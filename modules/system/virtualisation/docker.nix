{ config, lib, ... }: {
  options.myModules.virtualisation.docker.enable = lib.mkEnableOption "Enable Docker";

  config = lib.mkIf config.myModules.virtualisation.docker.enable {
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
