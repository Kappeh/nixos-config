{ config, lib, ... }: {
  imports = [
    ./ollama.nix
  ];

  options.myModules.services.enable = lib.mkEnableOption "Enable all services by default";

  config.myModules.services = with config.myModules.services; {
    ollama.enable = lib.mkDefault enable;
  };
}
