{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.ntfy.enable = lib.mkEnableOption "Enable ntfy workload";

  config = with config.kappeh.workloads; {
    users.users.ntfy_server = {
      uid = 2002;
      group = "ntfy_server";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.ntfy_server = {
      name = "ntfy_server";
      gid = 2002;
      members = [
        "ntfy_server"
        "kieran"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf ntfy.enable [ 8146 ];
  };
}

