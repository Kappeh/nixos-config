{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.navidrome.enable = lib.mkEnableOption "Enable navidrome workload";

  config = with config.kappeh.workloads; {
    users.users.navidrome = {
      name = "navidrome";
      uid = 2012;
      group = "navidrome";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.navidrome = {
      name = "navidrome";
      gid = 2012;
      members = [
        "navidrome"
        "kieran"
      ];
    };

    kappeh.storage.shares.music_library_1.enable = lib.mkIf navidrome.enable true;

    networking.firewall.allowedTCPPorts = lib.mkIf navidrome.enable [ 4533 ];

    systemd.services.navidrome = lib.mkIf navidrome.enable {
      description = "Compose service navidrome";
      requires = [
        "docker.service"
        "mnt-music_library_1.mount"
      ];
      after = [
        "docker.service"
        "mnt-music_library_1.mount"
      ];
    };
  };
}

