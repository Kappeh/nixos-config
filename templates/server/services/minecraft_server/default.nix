{ ... }: {
  imports = [
    ./backup.nix
    ./update_blacklist.nix
  ];

  config = {
    myModules.shares.minecraft_server.enable = true;
    networking.firewall.allowedTCPPorts = [
      8201  # Duplicati Web UI
      8100  # Maps Web UI
      25585 # Schematics Web UI
    ];
  };
}
