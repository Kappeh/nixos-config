{ pkgs, ... }: {
  config.users = {
    users.rota = {
      uid = 2018;
      group = "rota";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.rota = {
      name = "rota";
      gid = 2018;
      members = [
        "rota"
        "kieran"
      ];
    };
  };
}
