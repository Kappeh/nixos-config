{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.hyprpicker ];
}
