{ config, lib, ... }: {
  options.myModules.core.opengl.enable = lib.mkEnableOption "Enable OpenGL";

  config = lib.mkIf config.myModules.core.opengl.enable {
    hardware.graphics.enable = true;
  };
}
