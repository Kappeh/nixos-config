{ config, lib, ... }: {
  options.myModules.services.docker.home_assistant.enable = lib.mkEnableOption "Enable home_assistant service";

  config = lib.mkIf config.myModules.services.docker.home_assistant.enable {
    myModules.shares.home_assistant_1.enable = true;
    networking.firewall.allowedTCPPorts = [ 8123 ];
  };
}
