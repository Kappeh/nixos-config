{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.jellyfin.enable = lib.mkEnableOption "Enable jellyfin workload";

  config = with config.kappeh.workloads; {
    users.users.jellyfin = {
      name = "jellyfin";
      uid = 2007;
      group = "jellyfin";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.jellyfin = {
      name = "jellyfin";
      gid = 2007;
      members = [
        "jellyfin"
        "kieran"
      ];
    };

    kappeh.storage.shares.media_library_1.enable = lib.mkIf jellyfin.enable true;

    networking.firewall.allowedTCPPorts = lib.mkIf jellyfin.enable [ 8096 ];
  };
}

