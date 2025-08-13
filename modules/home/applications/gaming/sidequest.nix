{ config, lib, pkgs, ... }: {
  options.myModules.applications.gaming.sidequest.enable = lib.mkEnableOption "Enable SideQuest";

  config = lib.mkIf config.myModules.applications.gaming.sidequest.enable {
    home.packages = [ pkgs.sidequest ];
  };
}
