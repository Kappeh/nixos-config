{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.gparted ];
}
