{ config, lib, ... }: {
  imports = [
    ./cava.nix
    ./davinci_resolve.nix
    ./easyeffects.nix
    ./feh.nix
    ./feishin.nix
    ./gimp.nix
    ./krita.nix
    ./obs_studio.nix
    ./picard.nix
    ./vlc.nix
  ];

  options.kappeh.media.enable = lib.mkEnableOption "Enable media capability";

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

