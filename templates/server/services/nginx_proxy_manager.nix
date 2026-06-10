{ ... }: {
  config.networking.firewall.allowedTCPPorts = [
    80   # HTTP
    443  # HTTPS
    8181 # Web UI
  ];
}
