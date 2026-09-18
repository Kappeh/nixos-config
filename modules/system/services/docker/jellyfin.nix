{ config, lib, ... }: {
  options.myModules.services.docker.jellyfin.enable = lib.mkEnableOption "Enable jellyfin service";

  config = lib.mkIf config.myModules.services.docker.jellyfin.enable {
    myModules.shares.media_library_1.enable = true;
    networking.firewall.allowedTCPPorts = [ 8096 ];
  };
}
