{ config, lib, ... }: {
  imports = [
    ./cursor_theme/default.nix
    ./hyprland/default.nix
    ./waybar/default.nix
    ./wofi/default.nix
    ./wofi_power_menu/default.nix
    ./cliphist.nix
    ./dconf.nix
    ./libnotify.nix
    ./mako.nix
    ./swww.nix
    ./udiskie.nix
    ./xdg_mime.nix
  ];

  options.myModules.desktop.enable = lib.mkEnableOption "Enable desktop";

  config = lib.mkIf config.myModules.desktop.enable {
    myModules.desktop = {
      cursor_theme.enable = lib.mkDefault true;
      hyprland.enable = lib.mkDefault true;
      waybar.enable = lib.mkDefault true;
      wofi.enable = lib.mkDefault true;
      wofi_power_menu.enable = lib.mkDefault true;
      cliphist.enable = lib.mkDefault true;
      dconf.enable = lib.mkDefault true;
      libnotify.enable = lib.mkDefault true;
      mako.enable = lib.mkDefault true;
      swww.enable = lib.mkDefault true;
      udiskie.enable = lib.mkDefault true;
      xdg_mime.enable = lib.mkDefault true;
    };
  };
}
