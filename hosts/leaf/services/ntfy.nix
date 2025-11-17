{ inputs, pkgs, ... }: {
  config.users = {
    users = {
      ntfy_server = {
        uid = 2002;
        group = "ntfy_server";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      ntfy_deploy = {
        uid = 2003;
        group = "ntfy_deploy";
        extraGroups = [
          "deploy"
          "docker"
        ];
        openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHIC6onCBF+F/d0rwByTms8kOGHKFH/Q/vw/EFEPPpoe ntfy_deploy_ed25519" ];
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.bash;
      };
    };
    groups = {
      ntfy_server = {
        name = "ntfy_server";
        gid = 2002;
        members = [
          "ntfy_server"
          "kieran"
        ];
      };
      ntfy_deploy = {
        name = "ntfy_deploy";
        gid = 2003;
        members = [
          "ntfy_deploy"
          "kieran"
        ];
      };
    };
  };
}

