{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.jellyfin-media-player ];
}
