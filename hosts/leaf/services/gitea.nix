{ pkgs, ... }: {
  config.users = {
    users = {
      gitea = {
        uid = 2000;
        group = "gitea";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      act_runner = {
        uid = 2001;
        group = "act_runner";
        extraGroups = [ "docker" ];
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
    };
    groups = {
      gitea = {
        gid = 2000;
        members = [
          "gitea"
          "kieran"
        ];
      };
      act_runner = {
        gid = 2001;
        members = [
          "act_runner"
          "kieran"
        ];
      };
    };
  };
}

