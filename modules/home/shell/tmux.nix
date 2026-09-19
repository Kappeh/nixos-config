{ config, lib, ... }: {
  options.kappeh.shell.tmux.enable = lib.mkEnableOption "Enable tmux";

  config.programs.tmux = lib.mkIf config.kappeh.shell.tmux.enable {
    enable = true;

    clock24 = true;
    disableConfirmationPrompt = true;
    historyLimit = 10000;
    keyMode = "vi";
    mouse = true;
    newSession = true;
    shell = "\${pkgs.zsh}/bin/zsh";
  };
}

