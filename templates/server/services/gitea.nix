{ inputs, pkgs, ... }: {
  config.users = {
    users = {
      gitea_server = {
        uid = 2000;
        group = "gitea_server";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      gitea_runner = {
        uid = 2001;
        group = "gitea_runner";
        extraGroups = [ "docker" ];
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
    };
    groups = {
      gitea_server = {
        name = "gitea_server";
        gid = 2000;
        members = [
          "gitea_server"
          "kieran"
        ];
      };
      gitea_runner = {
        name = "gitea_runner";
        gid = 2001;
        members = [
          "gitea_runner"
          "kieran"
        ];
      };
    };
  };
}
