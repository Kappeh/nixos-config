{ pkgs, ... }: {
  config.users = {
    users.ente = {
      uid = 2008;
      group = "ente";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.ente = {
      name = "ente";
      gid = 2008;
      members = [
        "ente"
        "kieran"
      ];
    };
  };
}
