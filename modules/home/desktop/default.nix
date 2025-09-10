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

  config.myModules.desktop = {
    cursor_theme.enable = lib.mkDefault config.myModules.desktop.enable;
    hyprland.enable = lib.mkDefault config.myModules.desktop.enable;
    waybar.enable = lib.mkDefault config.myModules.desktop.enable;
    wofi.enable = lib.mkDefault config.myModules.desktop.enable;
    wofi_power_menu.enable = lib.mkDefault config.myModules.desktop.enable;
    cliphist.enable = lib.mkDefault config.myModules.desktop.enable;
    dconf.enable = lib.mkDefault config.myModules.desktop.enable;
    libnotify.enable = lib.mkDefault config.myModules.desktop.enable;
    mako.enable = lib.mkDefault config.myModules.desktop.enable;
    swww.enable = lib.mkDefault config.myModules.desktop.enable;
    udiskie.enable = lib.mkDefault config.myModules.desktop.enable;
    xdg_mime.enable = lib.mkDefault config.myModules.desktop.enable;
  };
}
