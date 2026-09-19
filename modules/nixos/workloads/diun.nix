{ pkgs, ... }: {
  config = {
    users.users.diun = {
      name = "diun";
      uid = 2023;
      group = "diun";
      extraGroups = [ "docker" ];
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.diun = {
      name = "diun";
      gid = 2023;
      members = [
        "diun"
        "kieran"
      ];
    };
  };
}

