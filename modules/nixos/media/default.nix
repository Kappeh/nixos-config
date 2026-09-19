{ config, lib, ... }: {
  imports = [
    ./obs_studio.nix
  ];

  options.kappeh.media = {
    enable = lib.mkEnableOption "Enable media capability";

    cava.enable = lib.mkEnableOption "Enable Cava";
    davinci_resolve.enable = lib.mkEnableOption "Enable DaVinci Resolve";
    easyeffects.enable = lib.mkEnableOption "Enable EasyEffects";
    feh.enable = lib.mkEnableOption "Enable feh";
    feishin.enable = lib.mkEnableOption "Enable Feishin";
    gimp.enable = lib.mkEnableOption "Enable GIMP";
    krita.enable = lib.mkEnableOption "Enable Krita";
    picard.enable = lib.mkEnableOption "Enable Picard";
    vlc.enable = lib.mkEnableOption "Enable VLC";
  };

  config.kappeh.media = with config.kappeh; {
    cava.enable = lib.mkDefault media.enable;
    davinci_resolve.enable = lib.mkDefault media.enable;
    easyeffects.enable = lib.mkDefault media.enable;
    feh.enable = lib.mkDefault media.enable;
    feishin.enable = lib.mkDefault media.enable;
    gimp.enable = lib.mkDefault media.enable;
    krita.enable = lib.mkDefault media.enable;
    obs_studio.enable = lib.mkDefault media.enable;
    picard.enable = lib.mkDefault media.enable;
    vlc.enable = lib.mkDefault media.enable;
  };
}

