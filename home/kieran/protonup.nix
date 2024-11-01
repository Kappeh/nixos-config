{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.protonup-qt ];
}
