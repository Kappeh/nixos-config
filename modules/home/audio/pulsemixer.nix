{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.kappeh.audio.enable {
    home.packages = [ pkgs.pulsemixer ];
  };
}

