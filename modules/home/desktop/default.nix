{ lib, ... }: {
  imports = [
    ./cursor_theme/default.nix
    ./hypr/default.nix
    ./waybar/default.nix
    ./awww.nix
    ./cliphist.nix
    ./dconf.nix
    ./libnotify.nix
    ./mako.nix
    ./rofi.nix
    ./screenshot.nix
    ./udiskie.nix
    ./wlr_which_key.nix
    ./xdg_mime.nix
  ];

  options.myModules.desktop.enable = lib.mkEnableOption "Enable desktop";
}
