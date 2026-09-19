{ config, lib, ... }: {
  imports = [
    ./minecraft_server/default.nix
    ./cipher.nix
    ./deploy.nix
    ./diun.nix
    ./docker_registry.nix
    ./duplicati.nix
    ./ente.nix
    ./gitea.nix
    ./grafana.nix
    ./home_assistant.nix
    ./jellyfin.nix
    ./loki.nix
    ./mailrise.nix
    ./misc.nix
    ./mosquitto.nix
    ./namecheap_ddns.nix
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

  options.kappeh.workloads.enable = lib.mkEnableOption "Enable workloads capability";

  config.kappeh.workloads = with config.kappeh; {
    minecraft_server.enable = lib.mkDefault workloads.enable;
    deploy.enable = lib.mkDefault workloads.enable;
    docker_registry.enable = lib.mkDefault workloads.enable;
    duplicati.enable = lib.mkDefault workloads.enable;
    ente.enable = lib.mkDefault workloads.enable;
    gitea.enable = lib.mkDefault workloads.enable;
    home_assistant.enable = lib.mkDefault workloads.enable;
    jellyfin.enable = lib.mkDefault workloads.enable;
    mailrise.enable = lib.mkDefault workloads.enable;
    misc.enable = lib.mkDefault workloads.enable;
    mosquitto.enable = lib.mkDefault workloads.enable;
    navidrome.enable = lib.mkDefault workloads.enable;
    nginx_proxy_manager.enable = lib.mkDefault workloads.enable;
    ntfy.enable = lib.mkDefault workloads.enable;
    portainer.enable = lib.mkDefault workloads.enable;
    rota.enable = lib.mkDefault workloads.enable;
    synapse.enable = lib.mkDefault workloads.enable;
    syncthing.enable = lib.mkDefault workloads.enable;
    uptime_kuma.enable = lib.mkDefault workloads.enable;
    whisper.enable = lib.mkDefault workloads.enable;
    wireguard.enable = lib.mkDefault workloads.enable;
  };
}

