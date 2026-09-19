{ config, ... }: {
  config = {
    sops.secrets.wg0 = {
      format = "binary";
      sopsFile = ../../secrets/wg0;
    };

    networking = {
      hostName = "neri";

      # Enable wake-on-lan
      interfaces.enp3s0.wakeOnLan.enable = true;
      firewall.allowedUDPPorts = [ 9 ];

      useDHCP = false;                # Disable dhcp for static ip
      nameservers = [ "10.0.1.104" ]; # Use local dns server

      wg-quick.interfaces.wg0 = {
        type = "wireguard";
        configFile = config.sops.secrets."wg0".path;
        dns = [ "10.0.1.104" ];
      };
    };

    systemd.network = {
      enable = true;
      networks."10-enp3s0" = {
        enable = true;
        name = "enp3s0";
        DHCP = "no";
        address = [ "10.0.69.69/16" ];
        gateway = [ "10.0.0.1" ];
        dns = [ "10.0.1.104" ];
      };
    };

    services.resolved = {
      enable = true;
      settings.Resolve.fallbackDns = []; # Disable fallback dns server, only use the primary dns server
    };
  };
}
