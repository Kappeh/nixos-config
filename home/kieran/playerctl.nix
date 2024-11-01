{ config, pkgs, ... }: {
  config = {
    home.packages = [ pkgs.playerctl ];

    services = {
      playerctld.enable = true;
      mpris-proxy.enable = true;
    };
  };
}
