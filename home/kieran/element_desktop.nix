{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.element-desktop ];
}
