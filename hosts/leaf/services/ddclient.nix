{ inputs, pkgs, ... }: {
  config.users = {
    users = {
      ddclient = {
        uid = 2007;
        group = "ddclient";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      ddclient_deploy = {
        uid = 2008;
        group = "ddclient_deploy";
        extraGroups = [
          "deploy"
          "docker"
        ];
        openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEBjHfKu6Ku7zqiUkEuxqt0ZV6FSTXLy9z2ISiDekdoF ddclient_deploy_ed25519" ];
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.bash;
      };
    };
    groups = {
      ddclient = {
        name = "ddclient";
        gid = 2007;
        members = [
          "ddclient"
          "kieran"
        ];
      };
      ddclient_deploy = {
        name = "ddclient_deploy";
        gid = 2008;
        members = [
          "ddclient_deploy"
          "kieran"
        ];
      };
    };
  };
}

