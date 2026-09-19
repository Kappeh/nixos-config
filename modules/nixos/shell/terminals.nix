{ config, lib, ... }: {
  options.kappeh.shell.terminals = {
    enable = lib.mkEnableOption "Enable all terminals by default";

    alacritty.enable = lib.mkEnableOption "Enable Alacritty";
    kitty.enable = lib.mkEnableOption "Enable Kitty";
  };

  config.kappeh.shell.terminals = with config.kappeh.shell; {
    alacritty.enable = lib.mkDefault terminals.enable;
    kitty.enable = lib.mkDefault terminals.enable;
  };
}

