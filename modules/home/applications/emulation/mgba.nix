{ config, lib, pkgs, ... }: {
  options.myModules.applications.emulation.mgba.enable = lib.mkEnableOption "Enable mGBA";

  config = lib.mkIf config.myModules.applications.emulation.mgba.enable {
    home.packages = [ pkgs.mgba ];
  };
}
