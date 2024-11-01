{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.gqrx ];
}
