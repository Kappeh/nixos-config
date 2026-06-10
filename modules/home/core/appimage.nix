{ config, lib, ... }: {
  options.myModules.core.appimage.enable = lib.mkEnableOption "Enable AppImage";

  config.home = lib.mkIf config.myModules.core.appimage.enable {
    persistence."/persist".directories = [ ".cache/appimage-run" ];
  };
}
