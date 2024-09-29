{ config, ... }: {
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    enableVteIntegration = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      extended = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };

    oh-my-zsh = {
      enable = true;

      plugins = [
        "bgnotify"
        "rust"
      ];

      theme = "jispwoso";
    };
  };
}
