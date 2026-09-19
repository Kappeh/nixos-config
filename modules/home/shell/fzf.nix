{ config, lib, ... }: {
  options.kappeh.shell.fzf.enable = lib.mkEnableOption "Enable fzf";

  config.programs.fzf = lib.mkIf config.kappeh.shell.fzf.enable {
    enable = true;

    defaultCommand = "fd --type f";

    changeDirWidget = {
      command = "fd --type d";
      options = [
        "--preview 'eza --tree --color=always {} | head -200'"
      ];
    };

    fileWidget = {
      command = "fd --type f";
      options = [
        "--preview 'bat -r :50 --color always {}'"
      ];
    };

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    tmux.enableShellIntegration = true;
  };
}

