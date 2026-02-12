{ pkgs, ... }: {
  config = {
    fileSystems."/mnt/duplicati_backup_1" = {
      device = "omv.home.kappeh.org:/export/duplicati-backup-1";
      fsType = "nfs";
      options = [
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
      ];
    };

    networking.firewall.allowedTCPPorts = [ 8200 ];

    users = {
      users.duplicati = {
        uid = 2011;
        group = "duplicati";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      groups.duplicati = {
        name = "duplicati";
        gid = 2011;
        members = [
          "duplicati"
          "kieran"
        ];
      };
    };
  };
}
