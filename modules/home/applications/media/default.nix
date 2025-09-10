{ config, lib, ... }: {
  imports = [
    ./davinci_resolve.nix
    ./easyeffects.nix
    ./feh.nix
    ./feishin.nix
    ./freetube.nix
    ./gimp.nix
    ./jellyfin_media_player.nix
    ./libreoffice.nix
    ./obs_studio.nix
    ./vlc.nix
  ];

  options.myModules.applications.media.enable = lib.mkEnableOption "Enable media applications";

  config.myModules.applications.media = {
    davinci_resolve.enable = lib.mkDefault config.myModules.applications.media.enable;
    easyeffects.enable = lib.mkDefault config.myModules.applications.media.enable;
    feh.enable = lib.mkDefault config.myModules.applications.media.enable;
    feishin.enable = lib.mkDefault config.myModules.applications.media.enable;
    freetube.enable = lib.mkDefault config.myModules.applications.media.enable;
    gimp.enable = lib.mkDefault config.myModules.applications.media.enable;
    jellyfin_media_player.enable = lib.mkDefault config.myModules.applications.media.enable;
    libreoffice.enable = lib.mkDefault config.myModules.applications.media.enable;
    obs_studio.enable = lib.mkDefault config.myModules.applications.media.enable;
    vlc.enable = lib.mkDefault config.myModules.applications.media.enable;
  };
}
