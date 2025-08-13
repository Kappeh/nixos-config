{ config, lib, ... }: {
  options.myModules.shells.zsh.enable = lib.mkEnableOption "Enable Zsh";

  config = lib.mkIf config.myModules.shells.zsh.enable {
    programs.zsh.enable = true;
  };
}
