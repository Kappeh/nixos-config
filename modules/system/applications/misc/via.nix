{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.via.enable = lib.mkEnableOption "Enable Via";

  config = lib.mkIf config.myModules.applications.misc.via.enable {
    services.udev.packages = [ pkgs.via ];
  };
}
