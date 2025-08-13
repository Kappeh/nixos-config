{ config, lib, pkgs, ... }: {
  options.myModules.applications.media.libreoffice.enable = lib.mkEnableOption "Enable LibreOffice";

  config = lib.mkIf config.myModules.applications.media.libreoffice.enable {
    home.packages = [ pkgs.libreoffice-qt ];
  };
}
