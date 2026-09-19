{ config, lib, ... }: {
  imports = [
    ./ollama.nix
    ./syncthing.nix
  ];

  options.kappeh.services.enable = lib.mkEnableOption "Enable services capability";

  config.kappeh.services = with config.kappeh; {
    ollama.enable = lib.mkDefault services.enable;
    syncthing.enable = lib.mkDefault services.enable;
  };
}

