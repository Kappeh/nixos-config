{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.wireshark ];
}
