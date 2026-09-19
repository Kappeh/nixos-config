{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.synapse.enable = lib.mkEnableOption "Enable synapse workload";

  config = with config.kappeh.workloads; {
    users.users.synapse = {
      name = "synapse";
      uid = 2016;
      group = "synapse";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.synapse = {
      name = "synapse";
      gid = 2016;
      members = [
        "synapse"
        "kieran"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf synapse.enable [ 8008 ];
  };
}

