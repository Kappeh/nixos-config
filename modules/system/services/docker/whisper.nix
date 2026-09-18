{ config, lib, ... }: {
  options.myModules.services.docker.whisper.enable = lib.mkEnableOption "Enable whisper service";

  config = lib.mkIf config.myModules.services.docker.whisper.enable {
    networking.firewall.allowedTCPPorts = [ 10300 ];
  };
}
