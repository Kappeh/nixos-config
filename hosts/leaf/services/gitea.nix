{ inputs, pkgs, ... }: {
  config = {
    users = {
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
        gitea_deploy = {
          uid = 2002;
          group = "gitea_deploy";
          extraGroups = [ "docker" ];
          isNormalUser = false;
          isSystemUser = true;
          createHome = true;
          home = "/home/gitea_deploy";
          useDefaultShell = false;
          shell = pkgs.bash;
          packages = [ pkgs.git ];
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINj0MBPdFYe4Rx5lxtWQ1lWpl2y6amHfdPX1TcbeY43j gitea_deploy"
          ];
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
        gitea_deploy = {
          gid = 2002;
          members = [
            "gitea_deploy"
            "kieran"
          ];
        };
      };
    };
    home-manager.users.gitea_deploy = { config, ... }: {
      imports = [ inputs.impermanence.nixosModules.home-manager.impermanence ];
      config.home = {
        username = "gitea_deploy";
        homeDirectory = "/home/gitea_deploy";
        stateVersion = "24.05";
        persistence."/persist/home/${config.home.username}" = {
          allowOther = true;
          directories = [ ".ssh" ];
        };
      };
    };
  };
}

