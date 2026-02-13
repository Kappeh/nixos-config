{ pkgs, ... }: {
  config = {
    fileSystems."/mnt/video_library_1" = {
      device = "omv.home.kappeh.org:/export/video-library-1";
      fsType = "nfs";
      options = [
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
        "nolock"
      ];
    };

    networking.firewall.allowedTCPPorts = [ 8096 ];

    users = {
      users.jellyfin = {
        uid = 2007;
        group = "jellyfin";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      groups.jellyfin = {
        name = "jellyfin";
        gid = 2007;
        members = [
          "jellyfin"
          "kieran"
        ];
      };
    };
  };
}
