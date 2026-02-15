{ pkgs, ... }: {
  imports = [
    ./gitea.nix                    # 2000, 2001
    ./ntfy.nix                     # 2002
    ./loki.nix                     # 2003
    ./mailrise.nix                 # 2004
    ./grafana.nix                  # 2005
    ./portainer.nix                # 2006
    ./jellyfin.nix                 # 2007
    ./ente.nix                     # 2008
    ./uptime_kuma.nix              # 2009
    ./syncthing.nix                # 2010
    ./duplicati.nix                # 2011
    ./navidrome.nix                # 2012
    ./namecheap_ddns.nix           # 2013
    ./docker_registry.nix          # 2014
    ./minecraft_server/default.nix # 2015
    ./synapse.nix                  # 2016
    ./cipher.nix                   # 2017
    ./rota.nix                     # 2018
    ./home_assistant.nix           # 2019
    ./mosquitto.nix                # 2020
    ./nginx_proxy_manager.nix      # 2021
    ./whisper.nix                  # 2022
  ];

  config.networking.firewall.allowedTCPPorts = [
    10000
    10001
    10002
    10003
    10004
    10005
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
