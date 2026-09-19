{ lib, ... }: {
  imports = [
    ./cursor_theme/default.nix
    ./hypr/default.nix
    ./waybar/default.nix
    ./awww.nix
    ./cliphist.nix
    ./dconf.nix
    ./fontcache.nix
    ./libnotify.nix
    ./mako.nix
    ./numlock.nix
    ./rofi.nix
    ./screenshot.nix
    ./wlr_which_key.nix
    ./xdg_mime.nix
  ];

  options.kappeh.desktop.enable = lib.mkEnableOption "Enable desktop";
}

