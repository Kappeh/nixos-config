{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.blender ];
}
