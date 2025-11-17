{ inputs, pkgs, ... }: {
  config.users = {
    users = {
      mailrise_server = {
        uid = 2004;
        group = "mailrise_server";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      mailrise_deploy = {
        uid = 2005;
        group = "mailrise_deploy";
        extraGroups = [
          "deploy"
          "docker"
        ];
        openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB3/pdST1CdPguhfX4gXmOonHbudZ2pqZVJwXW6AIhqH mailrise_deploy_ed25519" ];
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.bash;
      };
    };
    groups = {
      mailrise_server = {
        name = "mailrise_server";
        gid = 2004;
        members = [
          "mailrise_server"
          "kieran"
        ];
      };
      mailrise_deploy = {
        name = "mailrise_deploy";
        gid = 2005;
        members = [
          "mailrise_deploy"
          "kieran"
        ];
      };
    };
  };
}

