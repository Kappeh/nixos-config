{ config, osConfig, lib, ... }: {
  config = {
    programs.bash = {
      enable = true;

      historyFile = "~/.bash_history";
      historyFileSize = 10000;
      historySize = 1000;

      enableVteIntegration = true;

      initExtra = builtins.readFile ./initExtra.sh;
    };

    home.persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".files = [ ".bash_history" ];
    };
  };
}
