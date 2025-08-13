{ config, lib, pkgs, ... }: {
  options.myModules.applications.emulation.citra.enable = lib.mkEnableOption "Enable Citra";

  config = lib.mkIf config.myModules.applications.emulation.citra.enable {
    home.packages = [ pkgs.libretro.citra ];
  };
}
