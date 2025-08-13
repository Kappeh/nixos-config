{ config, lib, pkgs, ... }: {
  options.myModules.desktop.cursor_theme.enable = lib.mkEnableOption "Enable cursor theme";

  config = lib.mkIf config.myModules.desktop.cursor_theme.enable {
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "Sunity-cursors";
      size = 24;
      package = import ./sunity_cursors.nix { inherit pkgs; };
    };
  };
}
