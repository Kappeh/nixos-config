{ config, lib, ... }: {
  options.myModules.services.docker.mosquitto.enable = lib.mkEnableOption "Enable mosquitto service";

  config = lib.mkIf config.myModules.services.docker.mosquitto.enable {
    networking.firewall.allowedTCPPorts = [
      1883 # MQTT (insecure/plaintext)
      9001 # MQTT over WebSocket
    ];
  };
}
