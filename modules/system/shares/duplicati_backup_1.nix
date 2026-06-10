{ config, lib, ... }: {
  options.myModules.shares.duplicati_backup_1.enable = lib.mkEnableOption "Enable duplicati_backup_1 share";

  config.fileSystems."/mnt/duplicati_backup_1" = lib.mkIf config.myModules.shares.duplicati_backup_1.enable {
    device = "omv.home.kappeh.org:/export/duplicati-backup-1";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=600"
    ];
  };
}

