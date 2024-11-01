{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.jetbrains.idea-community ];
}
