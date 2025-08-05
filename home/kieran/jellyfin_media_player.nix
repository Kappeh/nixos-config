{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.jellyfin-media-player ];

    persistence."/persist/home/kieran".directories = [
      ".local/share/Jellyfin Media Player"
      ".config/jellyfin.org"
      ".local/share/jellyfinmediaplayer"
    ];
  };
}
