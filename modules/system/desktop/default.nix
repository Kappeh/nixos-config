{ config, lib, ... }: {
  imports = [
    ./dconf.nix
    ./greetd.nix
    ./hyprland.nix
    ./udisks.nix
    ./xdg_terminal_exec.nix
  ];

  options.myModules.desktop = {
    enable = lib.mkEnableOption "Enable all desktop modules by default";

    awww.enable = lib.mkEnableOption "Enable awww";
    cliphist.enable = lib.mkEnableOption "Enable cliphist";
    cursor_theme.enable = lib.mkEnableOption "Enable cursor theme";
    libnotify.enable = lib.mkEnableOption "Enable libnotify";
    mako.enable = lib.mkEnableOption "Enable Mako";
    rofi.enable = lib.mkEnableOption "Enable Rofi";
    udiskie.enable = lib.mkEnableOption "Enable udiskie";
    waybar.enable = lib.mkEnableOption "Enable Waybar";
    wlr_which_key.enable = lib.mkEnableOption "Enable wlr-which-key";
    xdg_mime.enable = lib.mkEnableOption "Enable xdg-mime";
  };

  config.myModules.desktop = {
    awww.enable = lib.mkDefault config.myModules.desktop.enable;
    cliphist.enable = lib.mkDefault config.myModules.desktop.enable;
    cursor_theme.enable = lib.mkDefault config.myModules.desktop.enable;
    dconf.enable = lib.mkDefault config.myModules.desktop.enable;
    greetd.enable = lib.mkDefault config.myModules.desktop.enable;
    hyprland.enable = lib.mkDefault config.myModules.desktop.enable;
    libnotify.enable = lib.mkDefault config.myModules.desktop.enable;
    mako.enable = lib.mkDefault config.myModules.desktop.enable;
    rofi.enable = lib.mkDefault config.myModules.desktop.enable;
    udiskie.enable = lib.mkDefault config.myModules.desktop.enable;
    udisks.enable = lib.mkDefault config.myModules.desktop.enable;
    waybar.enable = lib.mkDefault config.myModules.desktop.enable;
    wlr_which_key.enable = lib.mkDefault config.myModules.desktop.enable;
  };
}
