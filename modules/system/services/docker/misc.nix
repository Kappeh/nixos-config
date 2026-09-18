{ config, lib, ... }: {
  options.myModules.services.docker.misc.enable = lib.mkEnableOption "Enable misc service";

  config = lib.mkIf config.myModules.services.docker.misc.enable {
    networking.firewall.allowedTCPPorts = [
      10000
      10001
      10002
      10003
      10004
      10005
      10006
      10007
      10008
    ];
  };
}
