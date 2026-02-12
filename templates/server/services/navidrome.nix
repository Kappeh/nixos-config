{ pkgs, ... }: {
  config = {
    fileSystems."/mnt/music_library_1" = {
      device = "omv.home.kappeh.org:/export/music-library-1";
      fsType = "nfs";
      options = [
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
      ];
    };

    networking.firewall.allowedTCPPorts = [ 4533 ];

    users = {
      users.navidrome = {
        uid = 2012;
        group = "navidrome";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      groups.navidrome = {
        name = "navidrome";
        gid = 2012;
        members = [
          "navidrome"
          "kieran"
        ];
      };
    };
  };
}
