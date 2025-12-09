{ pkgs, ... }: {
  imports = [
    ./gitea.nix          # 2000, 2001, 2006
    ./ntfy.nix           # 2002, 2003
    ./mailrise.nix       # 2004, 2005
    ./uptime_kuma.nix    # 2009, 2010
    ./namecheap_ddns.nix # 2013, 2014
  ];

  config.users = {
    users.deploy = {
      uid = 1999;
      group = "deploy";
      extraGroups = [
        "docker"
      ];
      isNormalUser = false;
      isSystemUser = true;
      openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG2TyRjq8GL0jmKvntfyTQoKdlzSPBRsS5+2HcTHRX1p deploy_ed25519" ];
      useDefaultShell = false;
      shell = pkgs.bash;
    };

    groups.deploy = {
      name = "deploy";
      gid = 1999;
      members = [
        "kieran"
        "deploy"

        "gitea_deploy"
        "ntfy_deploy"
        "mailrise_deploy"
        "uptime_kuma_deploy"
        "namecheap_ddns_deploy"
      ];
    };
  };

  config.environment.persistence."/persist/system".directories = [
    {
      directory = "/services";
      user = "kieran";
      group = "deploy";
      mode = "u=rwx,g=rwx,o=";
    }
  ];
}
