{ config, lib, ... }: {
  config = {
    programs.bash = {
      enable = true;

      historyFile = "${config.home.homeDirectory}/.bash_history";
      historyFileSize = 10000;
      historySize = 1000;

      enableVteIntegration = true;

      initExtra = builtins.readFile ./initExtra.sh;
    };

    home.persistence."/persist/home/${config.home.username}".files = [ ".bash_history" ];
  };
}
