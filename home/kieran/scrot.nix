{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.scrot ];
}
