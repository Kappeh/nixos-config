{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.nginx_proxy_manager.enable = lib.mkEnableOption "Enable nginx_proxy_manager workload";

  config = with config.kappeh.workloads; {
    users.users.nginx_proxy_manager = {
      name = "nginx_proxy_manager";
      uid = 2021;
      group = "nginx_proxy_manager";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.nginx_proxy_manager = {
      name = "nginx_proxy_manager";
      gid = 2021;
      members = [
        "nginx_proxy_manager"
        "kieran"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf nginx_proxy_manager.enable [
      80   # HTTP
      443  # HTTPS
      8181 # Web UI
    ];
  };
}

