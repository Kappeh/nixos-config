{ pkgs, ... }: {
  config.users = {
    users.portainer = {
      uid = 2006;
      group = "portainer";
      extraGroups = [
        "docker"
      ];
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.portainer = {
      name = "portainer";
      gid = 2006;
      members = [
        "portainer"
        "kieran"
      ];
    };
  };
}
