{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.myModules.desktop.hyprland.enable {
    home.packages = with pkgs; [
      grim
      slurp
      swappy
    ];
  };
}

