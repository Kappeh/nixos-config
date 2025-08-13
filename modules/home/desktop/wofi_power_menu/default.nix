{ config, lib, pkgs, ... }: {
  options.myModules.desktop.wofi_power_menu.enable = lib.mkEnableOption "Enable Wofi Power Menu";

  config = lib.mkIf config.myModules.desktop.wofi_power_menu.enable {
    home.packages = [ pkgs.wofi-power-menu ];

    xdg.configFile."wofi-power-menu.toml" = {
      enable = true;
      executable = false;
      text = builtins.readFile ./wofi_power_menu.toml;
    };
  };
}
