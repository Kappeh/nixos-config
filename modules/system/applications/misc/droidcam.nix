{ config, lib, ... }: {
  options.myModules.applications.misc.droidcam.enable = lib.mkEnableOption "Enable DroidCam";

  config = lib.mkIf config.myModules.applications.misc.droidcam.enable {
    programs.droidcam.enable = true;
  };
}
