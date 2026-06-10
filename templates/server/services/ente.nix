{ ... }: {
  config = {
    myModules.shares.ente_1.enable = true;
    networking.firewall.allowedTCPPorts = [
      3002 # Albums endpoint
      3007 # Photos endpoint
      3200 # Store endpoint
      8080 # API endpoint
    ];
  };
}
