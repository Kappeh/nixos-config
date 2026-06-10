{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.via.enable = lib.mkEnableOption "Enable Via";

  config.home = lib.mkIf config.myModules.applications.misc.via.enable {
    packages = [ pkgs.via ];
  };
}
