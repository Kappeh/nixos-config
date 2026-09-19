{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.deploy.enable = lib.mkEnableOption "Enable deployment of workloads on this host";

  config = lib.mkIf config.kappeh.workloads.deploy.enable {
    users.users.deploy = {
      name = "deploy";
      uid = 1999;
      group = "deploy";
      extraGroups = [ "docker" ];
      isNormalUser = false;
      isSystemUser = true;
      openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG2TyRjq8GL0jmKvntfyTQoKdlzSPBRsS5+2HcTHRX1p deploy_ed25519" ];
      useDefaultShell = false;
      shell = pkgs.bash;
    };

    users.groups.deploy = {
      name = "deploy";
      gid = 1999;
      members = [
        "kieran"
        "deploy"
      ];
    };

    environment.persistence."/persist/system".directories = [{
      directory = "/services";
      user = "deploy";
      group = "deploy";
      mode = "u=rwx,g=rwx,o=";
    }];
  };
}

