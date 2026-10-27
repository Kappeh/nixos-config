{
  config = {
    networking = {
      hostName = "ciela";
      # useDHCP = true;
    };

    # systemd.network = {
    #   enable = true;
    #   networks."10-ethernet" = {
    #     enable = true;
    #     matchConfig.Name = "ens18";
    #     networkConfig = {
    #       DHCP = "no";
    #       Address = "10.0.1.100/16";
    #       Gateway = "10.0.0.1";
    #       DNS = "10.0.1.104";
    #     };
    #   };
    # };
  };
}

