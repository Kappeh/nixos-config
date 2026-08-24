{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.myModules.desktop.enable {
    home.pointerCursor = {
      enable = true;
      gtk.enable = true;
      x11.enable = true;
      name = "Sunity-cursors";
      size = 24;
      package = import ./sunity_cursors.nix { inherit pkgs; };
    };
  };
}
