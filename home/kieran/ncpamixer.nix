{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.ncpamixer ];
}
