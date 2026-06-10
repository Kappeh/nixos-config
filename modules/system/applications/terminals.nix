{ config, lib, ... }: {
  options.myModules.applications.terminals = {
    enable = lib.mkEnableOption "Enable all terminals by default";

    alacritty.enable = lib.mkEnableOption "Enable Alacritty";
    kitty.enable = lib.mkEnableOption "Enable Kitty";
  };

  config.myModules.applications.terminals = {
    alacritty.enable = lib.mkDefault config.myModules.applications.terminals.enable;
    kitty.enable = lib.mkDefault config.myModules.applications.terminals.enable;
  };
}
