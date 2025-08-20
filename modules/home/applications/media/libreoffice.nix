{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.media.libreoffice.enable = lib.mkEnableOption "Enable LibreOffice";

  config = lib.mkIf config.myModules.applications.media.libreoffice.enable {
    home.packages = [ pkgs.libreoffice-qt ];

    home.persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [ ".config/libreoffice" ];
    };
  };
}
