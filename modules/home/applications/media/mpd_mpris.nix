{ config, lib, ... }: {
  options.myModules.applications.media.mpd_mpris.enable = lib.mkEnableOption "Enable mpd-mpris";

  config.services.mpd-mpris.enable = config.myModules.applications.media.mpd_mpris.enable;
}
