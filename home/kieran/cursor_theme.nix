{ config, pkgs, ... }: {
  config.home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Sunity-cursors";
    size = 24;
    package = import ../../cursor_themes/sunity_cursors.nix { inherit pkgs; };
  };
}
