{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.myModules.desktop.enable {
    home.packages = [ pkgs.hyprpicker ];
  };
}
