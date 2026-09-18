{ config, lib, ... }: {
  options.myModules.services.ollama.enable = lib.mkEnableOption "Enable Ollama";

  config = lib.mkIf config.myModules.services.ollama.enable {
    services.ollama = {
      enable = true;

      host = "127.0.0.1";
      port = 11434;
      acceleration = null;

      environmentVariables = {
      };
    };

    home.persistence."/persist".directories = [ ".ollama" ];
  };
}
