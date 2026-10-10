{
  config = {
    networking = {
      hostName = "neri";
      useDHCP = false;

      # Enable wake-on-lan
      interfaces.enp3s0.wakeOnLan.enable = true;
      firewall.allowedUDPPorts = [ 9 ];
    };

    systemd.network = {
      enable = true;
      networks."10-ethernet" = {
        enable = true;
        matchConfig.Name = "enp3s0";
        networkConfig = {
          DHCP = "no";
          Address = "10.0.69.69/16";
          Gateway = "10.0.0.1";
          DNS = "10.0.1.104";
        };
      };
    };

    kappeh.networking.wireguard.wg0.enable = true;
  };
}

