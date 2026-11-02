{
  config = {
    environment.persistence."/persist/system".directories = [
      "/var/lib/iwd"
    ];

    networking = {
      hostName = "ciela";

      # Use `iwd`'s internal DHCP client instead
      useDHCP = false;

      wireless.iwd = {
        enable = true;
        settings = {
          General = {
            EnableNetworkConfiguration = true;
            AddressRandomization = "network";
            AddressRandomizationRange = "full";
          };
          Network = {
            EnableIPv6 = true;
            RoutePriorityOffset = 300;
            # Use systemd-resolved as DNS resolver
            NameResolvingService = "systemd";
          };
        };
      };
    };
  };
}

