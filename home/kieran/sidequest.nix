{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.sidequest ];
}
