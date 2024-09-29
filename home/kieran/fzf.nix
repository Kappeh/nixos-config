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
      "--preview 'bat -r :50 --color always {}'"
    ];


    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    tmux.enableShellIntegration = true;
  };
}
