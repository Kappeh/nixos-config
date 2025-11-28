{ inputs, pkgs, ... }: {
  config.users = {
    users = {
      namecheap_ddns = {
        uid = 2013;
        group = "namecheap_ddns";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      namecheap_ddns_deploy = {
        uid = 2014;
        group = "namecheap_ddns_deploy";
        extraGroups = [
          "deploy"
          "docker"
        ];
        openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIcVkEijhrcjlHpMbagOJ0TYOazUJ1hXJMoUxSalSV2s namecheap_ddns_deploy_ed25519" ];
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.bash;
      };
    };
    groups = {
      namecheap_ddns = {
        name = "namecheap_ddns";
        gid = 2013;
        members = [
          "namecheap_ddns"
          "kieran"
        ];
      };
      namecheap_ddns_deploy = {
        name = "namecheap_ddns_deploy";
        gid = 2014;
        members = [
          "namecheap_ddns_deploy"
          "kieran"
        ];
      };
    };
  };
}

