{ inputs, pkgs, ... }: {
  config.users = {
    users = {
      traefik = {
        uid = 2011;
        group = "traefik";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      traefik_deploy = {
        uid = 2012;
        group = "traefik_deploy";
        extraGroups = [
          "deploy"
          "docker"
        ];
        openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHoqjbXiwBAw8pQsdTYndzGbCG1wlZOllxROAWA/JvI4 traefik_deploy_ed25519" ];
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.bash;
      };
    };
    groups = {
      traefik = {
        name = "traefik";
        gid = 2011;
        members = [
          "traefik"
          "kieran"
        ];
      };
      traefik_deploy = {
        name = "traefik_deploy";
        gid = 2012;
        members = [
          "traefik_deploy"
          "kieran"
        ];
      };
    };
  };
}

