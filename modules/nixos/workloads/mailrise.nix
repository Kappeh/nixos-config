{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.mailrise.enable = lib.mkEnableOption "Enable mailrise workload";

  config = with config.kappeh.workloads; {
    users.users.mailrise_server = {
      name = "mailrise_server";
      uid = 2004;
      group = "mailrise_server";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.mailrise_server = {
      name = "mailrise_server";
      gid = 2004;
      members = [
        "mailrise_server"
        "kieran"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf mailrise.enable [ 8025 ];
  };
}

