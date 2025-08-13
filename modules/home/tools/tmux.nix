{ config, lib, pkgs, ... }: {
  options.myModules.tools.tmux.enable = lib.mkEnableOption "Enable tmux";

  config = lib.mkIf config.myModules.tools.tmux.enable {
    programs.tmux = {
      enable = true;

      clock24 = true;
      disableConfirmationPrompt = true;
      historyLimit = 10000;
      keyMode = "vi";
      mouse = true;
      newSession = true;
      shell = "\${pkgs.zsh}/bin/zsh";
    };
  };
}
