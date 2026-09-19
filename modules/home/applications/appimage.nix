{ config, lib, ... }: {
  options.kappeh.applications.appimage.enable = lib.mkEnableOption "Enable AppImage";

  config.home = lib.mkIf config.kappeh.applications.appimage.enable {
    persistence."/persist".directories = [ ".cache/appimage-run" ];
  };
}

