{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.vlc ];
}
