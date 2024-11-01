{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.qmk ];
}
