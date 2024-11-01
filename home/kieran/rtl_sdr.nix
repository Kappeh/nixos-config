{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.rtl-sdr ];
}
