{ config, lib, ... }: {
  options.myModules.tools.fzf.enable = lib.mkEnableOption "Enable fzf";

  config = lib.mkIf config.myModules.tools.fzf.enable {
    programs.fzf = {
      enable = true;

      changeDirWidgetCommand = "fd --type d";
      changeDirWidgetOptions = [
        "--preview 'eza --tree --color=always {} | head -200'"
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
  };
}
