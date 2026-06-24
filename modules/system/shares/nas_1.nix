{ config, lib, ... }: {
  options.myModules.shares.nas_1.enable = lib.mkEnableOption "Enable nas_1 share";

  config.fileSystems."/mnt/nas_1" = lib.mkIf config.myModules.shares.nas_1.enable {
    device = "omv.home.kappeh.org:/export/nas-1";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=600"
      "nolock"
    ];
  };
}

