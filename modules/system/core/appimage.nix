{ config, lib, ... }: {
  options.myModules.core.appimage.enable = lib.mkEnableOption "Enable AppImage";

  config = lib.mkIf config.myModules.core.appimage.enable {
    programs.appimage = {
      enable = true;
      binfmt = true;
    };
  };
}
