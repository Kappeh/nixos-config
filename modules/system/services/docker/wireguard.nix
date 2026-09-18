{ config, lib, ... }: {
  options.myModules.services.docker.wireguard.enable = lib.mkEnableOption "Enable wireguard service";

  config = lib.mkIf config.myModules.services.docker.wireguard.enable {
    networking.firewall.allowedTCPPorts = [ 51820 ];
  };
}
