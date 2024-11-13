{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.davinci-resolve ];
}
