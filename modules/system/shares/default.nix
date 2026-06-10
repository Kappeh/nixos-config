{ lib, ... }: {
  imports = [
    ./docker_registry_2.nix
    ./duplicati_backup_1.nix
    ./ente_1.nix
    ./home_assistant_1.nix
    ./minecraft_server.nix
    ./music_library_1.nix
    ./video_library_1.nix
  ];

  config.myModules.shares = {
    docker_registry_2.enable = lib.mkDefault false;
    duplicati_backup_1.enable = lib.mkDefault false;
    ente_1.enable = lib.mkDefault false;
    home_assistant_1.enable = lib.mkDefault false;
    minecraft_server.enable = lib.mkDefault false;
    music_library_1.enable = lib.mkDefault false;
    video_library_1.enable = lib.mkDefault false;
  };
}
