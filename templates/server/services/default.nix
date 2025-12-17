{ pkgs, ... }: {
  imports = [
    ./gitea.nix          # 2000, 2001
    ./ntfy.nix           # 2002
    ./loki.nix           # 2003
    ./mailrise.nix       # 2004
    ./grafana.nix        # 2005
    ./portainer.nix      # 2006
    ./uptime_kuma.nix    # 2009
    ./namecheap_ddns.nix # 2013
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
      ];
    };
  };

  config.environment.persistence."/persist/system".directories = [
    {
      directory = "/services";
      user = "deploy";
      group = "deploy";
      mode = "u=rwx,g=rwx,o=";
    }
  ];
}
