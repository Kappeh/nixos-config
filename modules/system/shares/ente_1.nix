{ config, lib, ... }: {
  options.myModules.shares.ente_1.enable = lib.mkEnableOption "Enable ente_1 share";

  config.fileSystems."/mnt/ente_1" = lib.mkIf config.myModules.shares.ente_1.enable {
    device = "omv.home.kappeh.org:/export/ente-1";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=600"
    ];
  };
}

