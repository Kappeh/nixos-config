{ pkgs, ... }: {
  config = {
    fileSystems."/mnt/ente_1" = {
      device = "omv.home.kappeh.org:/export/ente-1";
      fsType = "nfs";
      options = [
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
      ];
    };

    networking.firewall.allowedTCPPorts = [
      3002 # Albums endpoint
      3007 # Photos endpoint
      3200 # Store endpoint
      8080 # API endpoint
    ];

    users = {
      users.ente = {
        uid = 2008;
        group = "ente";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      groups.ente = {
        name = "ente";
        gid = 2008;
        members = [
          "ente"
          "kieran"
        ];
      };
    };
  };
}
