{ config, lib, ... }: {
  imports = [
    ./mpd.nix
    ./obs_studio.nix
  ];

  options.myModules.applications.media = {
    enable = lib.mkEnableOption "Enable all media applications by default";

    cava.enable = lib.mkEnableOption "Enable Cava";
    davinci_resolve.enable = lib.mkEnableOption "Enable DaVinci Resolve";
    easyeffects.enable = lib.mkEnableOption "Enable EasyEffects";
    feh.enable = lib.mkEnableOption "Enable feh";
    feishin.enable = lib.mkEnableOption "Enable Feishin";
    gimp.enable = lib.mkEnableOption "Enable GIMP";
    krita.enable = lib.mkEnableOption "Enable Krita";
    libreoffice.enable = lib.mkEnableOption "Enable LibreOffice";
    mpd_mpris.enable = lib.mkEnableOption "Enable mpd-mpris";
    picard.enable = lib.mkEnableOption "Enable Picard";
    rmpc.enable = lib.mkEnableOption "Enable Rmpc";
    vlc.enable = lib.mkEnableOption "Enable VLC";
  };

  config.myModules.applications.media = {
    cava.enable = lib.mkDefault config.myModules.applications.media.enable;
    davinci_resolve.enable = lib.mkDefault config.myModules.applications.media.enable;
    easyeffects.enable = lib.mkDefault config.myModules.applications.media.enable;
    feh.enable = lib.mkDefault config.myModules.applications.media.enable;
    feishin.enable = lib.mkDefault config.myModules.applications.media.enable;
    gimp.enable = lib.mkDefault config.myModules.applications.media.enable;
    krita.enable = lib.mkDefault config.myModules.applications.media.enable;
    libreoffice.enable = lib.mkDefault config.myModules.applications.media.enable;
    mpd.enable = lib.mkDefault config.myModules.applications.media.enable;
    mpd_mpris.enable = lib.mkDefault config.myModules.applications.media.enable;
    obs_studio.enable = lib.mkDefault config.myModules.applications.media.enable;
    picard.enable = lib.mkDefault config.myModules.applications.media.enable;
    rmpc.enable = lib.mkDefault config.myModules.applications.media.enable;
    vlc.enable = lib.mkDefault config.myModules.applications.media.enable;
  };
}
