{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.keepassxc ];
}
