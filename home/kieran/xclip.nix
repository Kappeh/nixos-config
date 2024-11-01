{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.xclip ];
}
