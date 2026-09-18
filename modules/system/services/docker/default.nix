{ lib, ... }: {
  imports = [
    ./minecraft_server/default.nix
    ./deploy.nix
    ./docker.nix
    ./docker_registry.nix
    ./duplicati.nix
    ./ente.nix
    ./gitea.nix
    ./home_assistant.nix
    ./jellyfin.nix
    ./mailrise.nix
    ./misc.nix
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

  config.myModules.services.docker = {
    deploy.enable = lib.mkDefault false;

    minecraft_server.enable = lib.mkDefault false;
    docker_registry.enable = lib.mkDefault false;
    duplicati.enable = lib.mkDefault false;
    ente.enable = lib.mkDefault false;
    gitea.enable = lib.mkDefault false;
    home_assistant.enable = lib.mkDefault false;
    jellyfin.enable = lib.mkDefault false;
    mailrise.enable = lib.mkDefault false;
    misc.enable = lib.mkDefault false;
    mosquitto.enable = lib.mkDefault false;
    navidrome.enable = lib.mkDefault false;
    nginx_proxy_manager.enable = lib.mkDefault false;
    ntfy.enable = lib.mkDefault false;
    portainer.enable = lib.mkDefault false;
    rota.enable = lib.mkDefault false;
    synapse.enable = lib.mkDefault false;
    syncthing.enable = lib.mkDefault false;
    uptime_kuma.enable = lib.mkDefault false;
    whisper.enable = lib.mkDefault false;
    wireguard.enable = lib.mkDefault false;
  };
}
