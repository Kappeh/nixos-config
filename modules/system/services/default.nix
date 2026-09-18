{ config, lib, ... }: {
  imports = [
    ./docker/default.nix
  ];

  options.myModules.services = {
    enable = lib.mkEnableOption "Enable all services by default";

    ollama.enable = lib.mkEnableOption "Enable Ollama";
  };

  config.myModules.services = with config.myModules.services; {
    docker.enable = lib.mkDefault enable;
    ollama.enable = lib.mkDefault enable;
  };
}
