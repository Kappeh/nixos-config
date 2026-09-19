{ config, lib, pkgs, ... }: {
  options.kappeh.storage.f3.enable = lib.mkEnableOption "Enable f3";

  config = lib.mkIf config.kappeh.storage.f3.enable {
    home.packages = [ pkgs.f3 ];
  };
}

