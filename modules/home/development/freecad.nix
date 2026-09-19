{ config, lib, pkgs, ... }: {
  options.kappeh.development.freecad.enable = lib.mkEnableOption "Enable FreeCAD";

  config = lib.mkIf config.kappeh.development.freecad.enable {
    home.packages = [ pkgs.freecad ];
  };
}

