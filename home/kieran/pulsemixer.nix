{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.pulsemixer ];
}
