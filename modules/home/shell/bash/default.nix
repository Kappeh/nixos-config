{ config, ... }: {
  config = {
    home.persistence."/persist".files = [ ".bash_history" ];

    programs.bash = {
      enable = true;

      historyFile = "${config.home.homeDirectory}/.bash_history";
      historyFileSize = 10000;
      historySize = 1000;

      enableVteIntegration = true;

      initExtra = builtins.readFile ./initExtra.sh;
    };
  };
}

