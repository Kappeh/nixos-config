{ pkgs, ... }: {
  config.users = {
    users.gitea = {
      uid = 2000;
      group = "gitea";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.gitea = {
      gid = 2000;
      members = [
        "gitea"
        "kieran"
      ];
    };
  };
}
