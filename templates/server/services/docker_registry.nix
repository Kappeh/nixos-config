{ pkgs, ... }: {
  config = {
    fileSystems."/mnt/docker_registry_2" = {
      device = "omv.home.kappeh.org:/export/docker-registry-2";
      fsType = "nfs";
      options = [
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
      ];
    };

    networking.firewall.allowedTCPPorts = [ 5000 ];

    users = {
      users.docker_registry = {
        uid = 2014;
        group = "docker_registry";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      groups.docker_registry = {
        name = "docker_registry";
        gid = 2014;
        members = [
          "docker_registry"
          "kieran"
        ];
      };
    };
  };
}
