{ config, lib, pkgs, ... }: {
  options.kappeh.development.via.enable = lib.mkEnableOption "Enable Via";

  config = lib.mkIf config.kappeh.development.via.enable {
    services.udev.packages = [ pkgs.via ];
  };
}

