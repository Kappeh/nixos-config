{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.kappeh.desktop.enable {
    home.packages = with pkgs; [
      grim
      slurp
      swappy
    ];
  };
}

