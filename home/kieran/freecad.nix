{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.freecad ];
}