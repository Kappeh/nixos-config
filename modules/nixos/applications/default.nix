{ config, lib, ... }: {
  imports = [
    ./appimage.nix
    ./browsers.nix
    ./file_managers.nix
    ./rtl_sdr.nix
  ];

  options.kappeh.applications = {
    enable = lib.mkEnableOption "Enable applications capability";

    gqrx.enable = lib.mkEnableOption "Enable gqrx";
    libreoffice.enable = lib.mkEnableOption "Enable LibreOffice";
    obsidian.enable = lib.mkEnableOption "Enable Obsidian";
    qalculate.enable = lib.mkEnableOption "Enable Qalculate";
    xarchiver.enable = lib.mkEnableOption "Enable xarchiver";
  };

  config.kappeh.applications = with config.kappeh; {
    appimage.enable = lib.mkDefault applications.enable;
    browsers.enable = lib.mkDefault applications.enable;
    file_managers.enable = lib.mkDefault applications.enable;
    rtl_sdr.enable = lib.mkDefault applications.enable;

    gqrx.enable = lib.mkDefault applications.enable;
    libreoffice.enable = lib.mkDefault applications.enable;
    obsidian.enable = lib.mkDefault applications.enable;
    qalculate.enable = lib.mkDefault applications.enable;
    xarchiver.enable = lib.mkDefault applications.enable;
  };
}

