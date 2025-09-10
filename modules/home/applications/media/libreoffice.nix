{ config, lib, pkgs, ... }: {
  options.myModules.applications.media.libreoffice.enable = lib.mkEnableOption "Enable LibreOffice";

  config = lib.mkIf config.myModules.applications.media.libreoffice.enable {
    home.packages = [ pkgs.libreoffice-qt ];

    home.persistence."/persist/home/${config.home.username}".directories = [ ".config/libreoffice" ];
  };
}
