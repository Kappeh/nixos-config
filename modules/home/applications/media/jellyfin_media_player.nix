{ config, lib, pkgs, ... }: {
  options.myModules.applications.media.jellyfin_media_player.enable = lib.mkEnableOption "Enable Jellyfin Media Player";

  config = lib.mkIf config.myModules.applications.media.jellyfin_media_player.enable {
    home = {
      packages = [ pkgs.jellyfin-media-player ];

      persistence."/persist/home/${config.home.username}".directories = [
        ".local/share/Jellyfin Media Player"
        ".config/jellyfin.org"
        ".local/share/jellyfinmediaplayer"
      ];
    };
  };
}
