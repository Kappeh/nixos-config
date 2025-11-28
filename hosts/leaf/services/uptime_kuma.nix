{ inputs, pkgs, ... }: {
  config.users = {
    users = {
      uptime_kuma = {
        uid = 2009;
        group = "uptime_kuma";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      uptime_kuma_deploy = {
        uid = 2010;
        group = "uptime_kuma_deploy";
        extraGroups = [
          "deploy"
          "docker"
        ];
        openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG5FEzPkBl0yZn3PydjrOsgSV+AdtuFKGxv9jykCQaCT uptime_kuma_deploy_ed25519" ];
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.bash;
      };
    };
    groups = {
      uptime_kuma = {
        name = "uptime_kuma";
        gid = 2009;
        members = [
          "uptime_kuma"
          "kieran"
        ];
      };
      uptime_kuma_deploy = {
        name = "uptime_kuma_deploy";
        gid = 2010;
        members = [
          "uptime_kuma_deploy"
          "kieran"
        ];
      };
    };
  };
}

