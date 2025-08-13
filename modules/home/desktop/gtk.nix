{ config, lib, pkgs, ... }: {
  options.myModules.desktop.gtk.enable = lib.mkEnableOption "Enable gtk";

  config = lib.mkIf config.myModules.desktop.gtk.enable {
    home = {
      packages = [ pkgs.gnome-themes-extra ];

      sessionVariables = {
        GTK_THEME = "Adwaita:dark";
        GTK2_RC_FILES="${pkgs.gnome-themes-extra}/share/themes/Adwaita-dark/gtk-2.0/gtkrc";
      };
    };
  };
}
