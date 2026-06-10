{ pkgs, ... }: {
  config.users = {
    users.gitea_server = {
      uid = 2000;
      group = "gitea_server";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.gitea_server = {
      name = "gitea_server";
      gid = 2000;
      members = [
        "gitea_server"
        "kieran"
      ];
    };
  };
}
