{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.ente.enable = lib.mkEnableOption "Enable ente workload";

  config = with config.kappeh.workloads; {
    users.users.ente = {
      name = "ente";
      uid = 2008;
      group = "ente";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.ente = {
      name = "ente";
      gid = 2008;
      members = [
        "ente"
        "kieran"
      ];
    };

    kappeh.storage.shares.ente_1.enable = lib.mkIf ente.enable true;

    networking.firewall.allowedTCPPorts = lib.mkIf ente.enable [
      3002 # Albums endpoint
      3007 # Photos endpoint
      3200 # Store endpoint
      8080 # API endpoint
    ];
  };
}

