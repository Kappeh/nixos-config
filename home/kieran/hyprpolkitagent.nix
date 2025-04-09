{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.hyprpolkitagent ];
}
