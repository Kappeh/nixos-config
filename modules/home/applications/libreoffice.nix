{ config, lib, pkgs, ... }: {
  options.kappeh.applications.libreoffice.enable = lib.mkEnableOption "Enable LibreOffice";

  config.home = lib.mkIf config.kappeh.applications.libreoffice.enable {
    persistence."/persist".directories = [ ".config/libreoffice" ];

    packages = [ pkgs.libreoffice-qt ];
  };
}

