{ config, lib, ... }: {
  imports = [
    ./backup.nix
    ./time_set_day.nix
    ./update_blacklist.nix
  ];

  options.myModules.services.docker.minecraft_server.enable = lib.mkEnableOption "Enable minecraft_server service";

  config = lib.mkIf config.myModules.services.docker.minecraft_server.enable {
    myModules.shares.minecraft_server.enable = true;
    networking.firewall.allowedTCPPorts = [
      8201  # Duplicati Web UI
      8100  # Maps Web UI
      25585 # Schematics Web UI

      25565 # Velocity Endpoint
      25566 # Beta Server Endpoint
    ];
  };
}
