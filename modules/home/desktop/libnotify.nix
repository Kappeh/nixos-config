{ config, lib, pkgs, ... }: {
  options.myModules.desktop.libnotify.enable = lib.mkEnableOption "Enable libnotify";

  config = lib.mkIf config.myModules.desktop.libnotify.enable {
    home.packages = [ pkgs.libnotify ];
  };
}
