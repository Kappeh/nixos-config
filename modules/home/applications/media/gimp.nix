{ config, lib, pkgs, ... }: {
  options.myModules.applications.media.gimp.enable = lib.mkEnableOption "Enable GIMP";

  config = lib.mkIf config.myModules.applications.media.gimp.enable {
    home.packages = [ pkgs.gimp ];
  };
}
