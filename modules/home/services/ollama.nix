{ config, lib, ... }: {
  options.kappeh.services.ollama.enable = lib.mkEnableOption "Enable Ollama";

  config = lib.mkIf config.kappeh.services.ollama.enable {
    home.persistence."/persist".directories = [ ".ollama" ];

    services.ollama = {
      enable = true;

      host = "127.0.0.1";
      port = 11434;
      acceleration = null;

      environmentVariables = {};
    };
  };
}

