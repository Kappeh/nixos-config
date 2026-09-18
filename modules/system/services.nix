{ config, lib, ... }: {
  options.myModules.services = {
    enable = lib.mkEnableOption "Enable all services by default";
    ollama.enable = lib.mkEnableOption "Enable Ollama";
  };

  config.myModules.services = with config.myModules.services; {
    ollama.enable = lib.mkDefault enable;
  };
}
