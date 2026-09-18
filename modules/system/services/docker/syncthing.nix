{ config, lib, ... }: {
  options.myModules.services.docker.syncthing.enable = lib.mkEnableOption "Enable syncthing service";

  config = lib.mkIf config.myModules.services.docker.syncthing.enable {
    networking.firewall.allowedTCPPorts = [ 8384 ];
  };
}
