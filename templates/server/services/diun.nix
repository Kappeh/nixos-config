{ pkgs, ... }: {
  config.users = {
    users.diun = {
      uid = 2023;
      group = "diun";
      extraGroups = [ "docker" ];
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.diun = {
      name = "diun";
      gid = 2023;
      members = [
        "diun"
        "kieran"
      ];
    };
  };
}
