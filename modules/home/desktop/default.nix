{ lib, ... }: {
  imports = [
    ./cursor_theme/default.nix
    ./hypr/default.nix
    ./waybar/default.nix
    ./awww.nix
    ./brightnessctl.nix
    ./cliphist.nix
    ./dconf.nix
    ./fontconfig.nix
    ./libnotify.nix
    ./mako.nix
    ./numlock.nix
    ./options.nix
    ./rofi.nix
    ./screenshot.nix
    ./wlr_which_key.nix
    ./xdg_mime.nix
  ];

  options.kappeh.desktop.enable = lib.mkEnableOption "Enable desktop";
}

