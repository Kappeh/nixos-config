{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.gitea.enable = lib.mkEnableOption "Enable gitea workload";

  config = with config.kappeh.workloads; {
    users.users.gitea_server = {
      name = "gitea_server";
      uid = 2000;
      group = "gitea_server";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.gitea_server = {
      name = "gitea_server";
      gid = 2000;
      members = [
        "gitea_server"
        "kieran"
      ];
    };

    users.users.gitea_runner = {
      name = "gitea_runner";
      uid = 2001;
      group = "gitea_runner";
      extraGroups = [ "docker" ];
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.gitea_runner = {
      name = "gitea_runner";
      gid = 2001;
      members = [
        "gitea_runner"
        "kieran"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf gitea.enable [ 3000 ];
  };
}

