{ config, lib, pkgs, ... }: {
  options.myModules.shells.zsh.enable = lib.mkEnableOption "Enable Zsh";

  config = lib.mkIf config.myModules.shells.zsh.enable {
    programs.zsh = {
      enable = true;

      autocd = true;
      autosuggestion.enable = true;
      dotDir = "${config.xdg.configHome}/zsh";
      enableCompletion = true;
      enableVteIntegration = true;
      syntaxHighlighting.enable = true;

      history = {
        size = 10000;
        extended = true;
        path = "${config.xdg.dataHome}/zsh/zsh_history";
      };

      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];

      oh-my-zsh = {
        enable = true;

        plugins = [
          "bgnotify"
          "rust"
        ];

        theme = "jispwoso";
      };

      initContent = builtins.readFile "${pkgs.fzf-git-sh}/share/fzf-git-sh/fzf-git.sh";

      shellAliases = {
        cd = "z";
        ns = "nix-search-tv print | fzf -i --preview 'nix-search-tv preview {}' --scheme history --layout reverse";
      };
    };

    home.persistence."/persist/home/${config.home.username}".directories = [ ".local/share/zsh" ];
  };
}
