{ pkgs, ... }: {
  imports = [
    ./minecraft_server/default.nix
    ./docker_registry.nix
    ./duplicati.nix
    ./ente.nix
    ./gitea.nix
    ./home_assistant.nix
    ./jellyfin.nix
    ./mailrise.nix
    ./mosquitto.nix
    ./navidrome.nix
    ./nginx_proxy_manager.nix
    ./ntfy.nix
    ./portainer.nix
    ./rota.nix
    ./synapse.nix
    ./syncthing.nix
    ./uptime_kuma.nix
    ./whisper.nix
    ./wireguard.nix
  ];

  config.networking.firewall.allowedTCPPorts = [
    10000
    10001
    10002
    10003
    10004
    10005
    10006
    10007
    10008
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
