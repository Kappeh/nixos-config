{ config, lib, pkgs, ... }: {
  options.kappeh.development.via.enable = lib.mkEnableOption "Enable Via";

  config.home = lib.mkIf config.kappeh.development.via.enable {
    packages = [ pkgs.via ];
  };
}

