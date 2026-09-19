{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.docker_registry.enable = lib.mkEnableOption "Enable docker_registry workload";

  config = with config.kappeh.workloads; {
    users.users.docker_registry = {
      name = "docker_registry";
      uid = 2014;
      group = "docker_registry";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.docker_registry = {
      name = "docker_registry";
      gid = 2014;
      members = [
        "docker_registry"
        "kieran"
      ];
    };

    kappeh.storage.shares.docker_registry_2.enable = lib.mkIf docker_registry.enable true;

    networking.firewall.allowedTCPPorts = lib.mkIf docker_registry.enable [
      5000 # Registry
      5002 # Web UI
    ];
  };
}

