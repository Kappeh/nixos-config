{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.wireguard.enable = lib.mkEnableOption "Enable wireguard workload";

  config = with config.kappeh.workloads; {
    users.users.wireguard = {
      name = "wireguard";
      uid = 2024;
      group = "wireguard";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.wireguard = {
      name = "wireguard";
      gid = 2024;
      members = [
        "wireguard"
        "kieran"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf wireguard.enable [ 51820 ];
  };
}

