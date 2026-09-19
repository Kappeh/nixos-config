{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.kappeh.audio.enable {
    home.packages = [ pkgs.playerctl ];
    services = {
      playerctld.enable = true;
      mpris-proxy.enable = true;
    };
  };
}

