{ config, lib, ... }: {
  options.kappeh.networking.wireguard.wg0.enable = lib.mkEnableOption "Enable wg0 interface";

  config = lib.mkIf config.kappeh.networking.wireguard.wg0.enable {
    sops.secrets.wg0 = {
      format = "binary";
      sopsFile = ../../../../secrets/wg0;
    };

    networking.wg-quick.interfaces.wg0 = {
      type = "wireguard";
      configFile = config.sops.secrets."wg0".path;
      dns = [ "10.0.1.104" ];
    };
  };
}

