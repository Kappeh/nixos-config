{ config, lib, pkgs, ... }: {
  options.myModules.applications.emulation.cemu.enable = lib.mkEnableOption "Enable Cemu";

  config = lib.mkIf config.myModules.applications.emulation.cemu.enable {
    home.packages = [ pkgs.cemu ];
  };
}
