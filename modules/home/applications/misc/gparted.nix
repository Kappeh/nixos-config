{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.gparted.enable = lib.mkEnableOption "Enable GParted";

  config = lib.mkIf config.myModules.applications.misc.gparted.enable {
    home.packages = [ pkgs.gparted ];
  };
}
