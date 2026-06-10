{ pkgs, ... }: {
  config.users = {
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
}
