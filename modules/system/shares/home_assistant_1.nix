{ config, lib, ... }: {
  options.myModules.shares.home_assistant_1.enable = lib.mkEnableOption "Enable home_assistant_1 share";

  config.fileSystems."/mnt/home_assistant_1" = lib.mkIf config.myModules.shares.home_assistant_1.enable {
    device = "omv.home.kappeh.org:/export/home-assistant-1";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=600"
    ];
  };
}

