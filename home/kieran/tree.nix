{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.tree ];
}
