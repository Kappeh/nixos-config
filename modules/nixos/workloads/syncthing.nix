{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.syncthing.enable = lib.mkEnableOption "Enable syncthing workload";

  config = with config.kappeh.workloads; {
    users.users.syncthing = {
      name = "syncthing";
      uid = 2010;
      group = "syncthing";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.syncthing = {
      name = "syncthing";
      gid = 2010;
      members = [
        "syncthing"
        "kieran"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf syncthing.enable [ 8384 ];
  };
}

