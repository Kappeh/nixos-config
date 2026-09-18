{ config, lib, ... }: {
  options.myModules.services.docker.uptime_kuma.enable = lib.mkEnableOption "Enable uptime_kuma service";

  config = lib.mkIf config.myModules.services.docker.uptime_kuma.enable {
    networking.firewall.allowedTCPPorts = [ 3001 ];
  };
}
