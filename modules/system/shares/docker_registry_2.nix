{ config, lib, ... }: {
  options.myModules.shares.docker_registry_2.enable = lib.mkEnableOption "Enable docker_registry_2 share";

  config.fileSystems."/mnt/docker_registry_2" = lib.mkIf config.myModules.shares.docker_registry_2.enable {
    device = "omv.home.kappeh.org:/export/docker-registry-2";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=600"
    ];
  };
}

