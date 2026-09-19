{ config, lib, ... }: {
  imports = [
    ./docker.nix
  ];

  options.kappeh.services = {
    enable = lib.mkEnableOption "Enable services capability";

    ollama.enable = lib.mkEnableOption "Enable ollama";
    syncthing.enable = lib.mkEnableOption "Enable syncthing";
  };

  config.kappeh.services = with config.kappeh; {
    docker.enable = lib.mkDefault services.enable;

    ollama.enable = lib.mkDefault services.enable;
    syncthing.enable = lib.mkDefault services.enable;
  };
}

