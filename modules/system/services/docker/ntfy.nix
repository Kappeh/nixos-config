{ config, lib, ... }: {
  options.myModules.services.docker.ntfy.enable = lib.mkEnableOption "Enable ntfy service";

  config = lib.mkIf config.myModules.services.docker.ntfy.enable {
    networking.firewall.allowedTCPPorts = [ 8146 ];
  };
}
