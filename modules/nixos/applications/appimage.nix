{ config, lib, ... }: {
  options.kappeh.applications.appimage.enable = lib.mkEnableOption "Enable AppImage";

  config = lib.mkIf config.kappeh.applications.appimage.enable {
    programs.appimage = {
      enable = true;
      binfmt = true;
    };
  };
}

