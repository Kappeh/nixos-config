{ config, pkgs, ... }: {
  config.programs.tmux = {
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
