{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.portainer.enable = lib.mkEnableOption "Enable portainer workload";

  config = with config.kappeh.workloads; {
    users.users.portainer = {
      name = "portainer";
      uid = 2006;
      group = "portainer";
      extraGroups = [ "docker" ];
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.portainer = {
      name = "portainer";
      gid = 2006;
      members = [
        "portainer"
        "kieran"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf portainer.enable [ 9443 ];
  };
}

