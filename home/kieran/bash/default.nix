{ ... }: {
  programs.bash = {
    enable = true;

    historyFile = "~/.bash_history";
    historyFileSize = 10000;
    historySize = 1000;

    initExtra = builtins.readFile ./initExtra.sh;
  };
}
