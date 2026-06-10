{ pkgs, ... }: {
  config.users = {
    users.gitea_runner = {
      uid = 2001;
      group = "gitea_runner";
      extraGroups = [ "docker" ];
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.gitea_runner = {
      name = "gitea_runner";
      gid = 2001;
      members = [
        "gitea_runner"
        "kieran"
      ];
    };
  };
}
