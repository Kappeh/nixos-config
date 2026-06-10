{ ... }: {
  config.networking.firewall.allowedTCPPorts = [
    1883 # MQTT (insecure/plaintext)
    9001 # MQTT over WebSocket
  ];
}
