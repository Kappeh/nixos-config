{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.xarchiver ];
}
