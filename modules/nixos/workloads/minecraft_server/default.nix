{ config, lib, pkgs, ... }: {
  imports = [
    ./backup.nix
    ./time_set_day.nix
    ./update_blacklist.nix
  ];

  options.kappeh.workloads.minecraft_server.enable = lib.mkEnableOption "Enable minecraft_server workload";

  config = with config.kappeh.workloads; {
    users.users.minecraft_server = {
      name = "minecraft_server";
      uid = 2015;
      group = "minecraft_server";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.minecraft_server = {
      name = "minecraft_server";
      gid = 2015;
      members = [
        "minecraft_server"
        "kieran"
      ];
    };

    kappeh.storage.shares.minecraft_server.enable = lib.mkIf minecraft_server.enable true;

    networking.firewall.allowedTCPPorts = lib.mkIf minecraft_server.enable [
      8201  # Duplicati Web UI
      8100  # Maps Web UI
      25585 # Schematics Web UI

      25565 # Velocity Endpoint
      25566 # Beta Server Endpoint
    ];
  };
}

