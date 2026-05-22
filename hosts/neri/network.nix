{ ... }: {
  config = {
    networking = {
      hostName = "neri";

      # Enable wake-on-lan
      interfaces.enp3s0.wakeOnLan.enable = true;
      firewall.allowedUDPPorts = [ 9 ];
    };

    systemd.network.networks."10-enp3s0" = {
      enable = true;
      name = "enp3s0";
      DHCP = "no";
      address = [ "10.0.69.69/16" ];
      gateway = [ "10.0.0.1" ];
      dns = [ "10.0.1.104" ];
    };
  };
}
