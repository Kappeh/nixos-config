{ ... }: {
  config = {
    myModules.shares.home_assistant_1.enable = true;
    networking.firewall.allowedTCPPorts = [ 8123 ];
  };
}
