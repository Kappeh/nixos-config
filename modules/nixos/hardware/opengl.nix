{ config, lib, ... }: {
  options.kappeh.hardware.opengl.enable = lib.mkEnableOption "Enable OpenGL";

  config = lib.mkIf config.kappeh.hardware.opengl.enable {
    hardware.graphics.enable = true;
  };
}

