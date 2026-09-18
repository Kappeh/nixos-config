{ config, lib, ... }: {
  options.myModules.services.docker.nginx_proxy_manager.enable = lib.mkEnableOption "Enable nginx_proxy_manager service";

  config = lib.mkIf config.myModules.services.docker.nginx_proxy_manager.enable {
    networking.firewall.allowedTCPPorts = [
      80   # HTTP
      443  # HTTPS
      8181 # Web UI
    ];
  };
}
