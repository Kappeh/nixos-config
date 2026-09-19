{ config, lib, pkgs, ... }: {
  options.kappeh.media.vlc.enable = lib.mkEnableOption "Enable VLC";

  config = lib.mkIf config.kappeh.media.vlc.enable {
    home.packages = [ pkgs.vlc ];
  };
}

