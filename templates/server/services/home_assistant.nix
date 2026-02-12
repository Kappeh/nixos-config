{ pkgs, ... }: {
  config = {
    fileSystems."/mnt/home_assistant_1" = {
      device = "omv.home.kappeh.org:/export/home-assistant-1";
      fsType = "nfs";
      options = [
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
      ];
    };

    networking.firewall.allowedTCPPorts = [ 8123 ];

    users = {
      users.home_assistant = {
        uid = 2019;
        group = "home_assistant";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      groups.home_assistant = {
        name = "home_assistant";
        gid = 2019;
        members = [
          "home_assistant"
          "kieran"
        ];
      };
    };
  };
}
