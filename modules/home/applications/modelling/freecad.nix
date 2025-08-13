{ config, lib, pkgs, ... }: {
  options.myModules.applications.modelling.freecad.enable = lib.mkEnableOption "Enable FreeCAD";

  config = lib.mkIf config.myModules.applications.modelling.freecad.enable {
    home.packages = [ pkgs.freecad ];
  };
}
