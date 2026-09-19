{ config, lib, pkgs, ... }: {
  config.home.pointerCursor = lib.mkIf config.kappeh.desktop.enable {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    name = "Sunity-cursors";
    size = 24;
    package = import ./sunity_cursors.nix { inherit pkgs; };
  };
}

