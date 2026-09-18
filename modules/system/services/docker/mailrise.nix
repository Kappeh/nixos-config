{ config, lib, ... }: {
  options.myModules.services.docker.mailrise.enable = lib.mkEnableOption "Enable mailrise service";

  config = lib.mkIf config.myModules.services.docker.mailrise.enable {
    networking.firewall.allowedTCPPorts = [ 8025 ];
  };
}
