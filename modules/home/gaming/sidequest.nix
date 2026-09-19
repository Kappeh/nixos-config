{ config, lib, pkgs, ... }: {
  options.kappeh.gaming.sidequest.enable = lib.mkEnableOption "Enable SideQuest";

  config = lib.mkIf config.kappeh.gaming.sidequest.enable {
    home.packages = [ pkgs.sidequest ];
  };
}

