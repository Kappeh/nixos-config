{ config, lib, ... }: {
  imports = [
    ./cursor_theme/default.nix
    ./hyprland/default.nix
    ./waybar/default.nix
    ./awww.nix
    ./cliphist.nix
    ./dconf.nix
    ./gtk.nix
    ./libnotify.nix
    ./mako.nix
    ./rofi.nix
    ./udiskie.nix
    ./wlr_which_key.nix
    ./xdg_mime.nix
  ];

  options.myModules.desktop.enable = lib.mkEnableOption "Enable desktop";

  config.myModules.desktop = {
    cursor_theme.enable = lib.mkDefault config.myModules.desktop.enable;
    hyprland.enable = lib.mkDefault config.myModules.desktop.enable;
    wlr_which_key.enable = lib.mkDefault config.myModules.desktop.enable;
    rofi.enable = lib.mkDefault config.myModules.desktop.enable;
    waybar.enable = lib.mkDefault config.myModules.desktop.enable;
    cliphist.enable = lib.mkDefault config.myModules.desktop.enable;
    dconf.enable = lib.mkDefault config.myModules.desktop.enable;
    libnotify.enable = lib.mkDefault config.myModules.desktop.enable;
    mako.enable = lib.mkDefault config.myModules.desktop.enable;
    awww.enable = lib.mkDefault config.myModules.desktop.enable;
    udiskie.enable = lib.mkDefault config.myModules.desktop.enable;
    xdg_mime.enable = lib.mkDefault config.myModules.desktop.enable;
  };
}
