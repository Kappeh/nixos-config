{ config, lib, pkgs, ... }: {
  options.myModules.applications.emulation.desmume.enable = lib.mkEnableOption "Enable DeSmuME";

  config = lib.mkIf config.myModules.applications.emulation.desmume.enable {
    home.packages = [ pkgs.desmume ];
  };
}
