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
      gitea_deploy = {
        uid = 2006;
        group = "gitea_deploy";
        extraGroups = [
          "deploy"
          "docker"
        ];
        openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHKwqS0VecArqsgKSLxpb8wV0/Y3iaAzCR5/HMUdWAlB gitea_deploy_ed25519" ];
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.bash;
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
      gitea_deploy = {
        name = "gitea_deploy";
        gid = 2006;
        members = [
          "gitea_deploy"
          "kieran"
        ];
      };
    };
  };
}

