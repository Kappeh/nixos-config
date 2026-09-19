{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.uptime_kuma.enable = lib.mkEnableOption "Enable uptime_kuma workload";

  config = with config.kappeh.workloads; {
    users.users.uptime_kuma = {
      name = "uptime_kima";
      uid = 2009;
      group = "uptime_kuma";
      extraGroups = [ "docker" ];
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.uptime_kuma = {
      name = "uptime_kuma";
      gid = 2009;
      members = [
        "uptime_kuma"
        "kieran"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf uptime_kuma.enable [ 3001 ];
  };
}

