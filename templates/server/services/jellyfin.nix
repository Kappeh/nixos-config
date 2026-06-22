{ ... }: {
  config = {
    myModules.shares.media_library_1.enable = true;
    networking.firewall.allowedTCPPorts = [ 8096 ];
  };
}
