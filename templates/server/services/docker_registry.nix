{ ... }: {
  config = {
    myModules.shares.docker_registry_2.enable = true;
    networking.firewall.allowedTCPPorts = [
      5000 # Registry
      5002 # Web UI
    ];
  };
}
