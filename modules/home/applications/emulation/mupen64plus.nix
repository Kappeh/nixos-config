{ config, lib, pkgs, ... }: {
  options.myModules.applications.emulation.mupen64plus.enable = lib.mkEnableOption "Enable Mupen64Plus";

  config = lib.mkIf config.myModules.applications.emulation.mupen64plus.enable {
    home.packages = [ pkgs.mupen64plus ];
  };
}
