{ config, lib, ... }: {
  options.kappeh.communication.nicotine_plus.enable = lib.mkEnableOption "Enable Nicotine+";

  config = lib.mkIf config.kappeh.communication.nicotine_plus.enable {
    networking.firewall.allowedTCPPorts = [ 2234 ];
  };
}

