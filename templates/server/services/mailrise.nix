{ inputs, pkgs, ... }: {
  config.users = {
    users.mailrise_server = {
      uid = 2004;
      group = "mailrise_server";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.mailrise_server = {
      name = "mailrise_server";
      gid = 2004;
      members = [
        "mailrise_server"
        "kieran"
      ];
    };
  };
}
