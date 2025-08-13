{ config, lib, pkgs, ... }: {
  options.myModules.applications.media.vlc.enable = lib.mkEnableOption "Enable VLC";

  config = lib.mkIf config.myModules.applications.media.vlc.enable {
    home.packages = [ pkgs.vlc ];
  };
}
