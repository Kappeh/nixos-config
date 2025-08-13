{ config, ... }: {
  config = {
    networking = {
      hostName = "ciela";           # Define your hostname.
      useDHCP = false;              # Disable dhcp for static ip
      nameservers = [ "10.0.1.1" ]; # Use local dns server
    };

    systemd.network = {
      enable = true;
      networks."10-eno1" = {
        enable = true;
        name = "eno1";
        DHCP = "no";
        address = [ "10.0.1.5/16" ];
        gateway= [ "10.0.0.1" ];
        dns = [ "10.0.1.1" ];
      };
    };

    services.resolved = {
      enable = true;
      fallbackDns = []; # Disable fallback dns server, only use the primary dns server
    };
  };
}
