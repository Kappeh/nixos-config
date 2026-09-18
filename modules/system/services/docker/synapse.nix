{ config, lib, ... }: {
  options.myModules.services.docker.synapse.enable = lib.mkEnableOption "Enable synapse service";

  config = lib.mkIf config.myModules.services.docker.synapse.enable {
    networking.firewall.allowedTCPPorts = [ 8008 ];
  };
}
