{ config, lib, pkgs, ... }: {
  options.myModules.tools.playerctl.enable = lib.mkEnableOption "Enable playerctl";

  config = lib.mkIf config.myModules.tools.playerctl.enable {
    home.packages = [ pkgs.playerctl ];

    services = {
      playerctld.enable = true;
      mpris-proxy.enable = true;
    };
  };
}
