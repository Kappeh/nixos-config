{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.godot ];
}
