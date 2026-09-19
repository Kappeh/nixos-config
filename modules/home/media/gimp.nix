{ config, lib, pkgs, ... }: {
  options.kappeh.media.gimp.enable = lib.mkEnableOption "Enable GIMP";

  config = lib.mkIf config.kappeh.media.gimp.enable {
    home.packages = [ pkgs.gimp ];
  };
}

