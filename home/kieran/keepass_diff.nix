{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.keepass-diff ];
}
