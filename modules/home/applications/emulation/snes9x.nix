{ config, lib, pkgs, ... }: {
  options.myModules.applications.emulation.snes9x.enable = lib.mkEnableOption "Enable Snes9X";

  config = lib.mkIf config.myModules.applications.emulation.snes9x.enable {
    home.packages = [ pkgs.snes9x ];
  };
}
