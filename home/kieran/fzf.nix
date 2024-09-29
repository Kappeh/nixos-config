{ ... }: {
  programs.fzf = {
    enable = true;

    changeDirWidgetCommand = "fd --type d";
    changeDirWidgetOptions = [
      "--preview 'tree -C {} | head -200'"
    ];

    defaultCommand = "fd --type f";

    fileWidgetCommand = "fd --type f";
    fileWidgetOptions = [
      "--preview 'head {}'"
    ];


    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    tmux.enableShellIntegration = true;
  };
}
