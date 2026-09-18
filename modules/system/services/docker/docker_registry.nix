{ config, lib, ... }: {
  options.myModules.services.docker.docker_registry.enable = lib.mkEnableOption "Enable docker_registry service";

  config = lib.mkIf config.myModules.services.docker.docker_registry.enable {
    myModules.shares.docker_registry_2.enable = true;
    networking.firewall.allowedTCPPorts = [
      5000 # Registry
      5002 # Web UI
    ];
  };
}
