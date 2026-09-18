{ config, lib, ... }: {
  options.myModules.services.docker.portainer.enable = lib.mkEnableOption "Enable portainer service";

  config = lib.mkIf config.myModules.services.docker.portainer.enable {
    networking.firewall.allowedTCPPorts = [ 9443 ];
  };
}
