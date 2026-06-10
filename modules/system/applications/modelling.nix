{ config, lib, ... }: {
  options.myModules.applications.modelling = {
    enable = lib.mkEnableOption "Enable all modelling applications by default";

    blender.enable = lib.mkEnableOption "Enable Blender";
    freecad.enable = lib.mkEnableOption "Enable FreeCAD";
  };

  config.myModules.applications.modelling = {
    blender.enable = lib.mkDefault config.myModules.applications.modelling.enable;
    freecad.enable = lib.mkDefault config.myModules.applications.modelling.enable;
  };
}
