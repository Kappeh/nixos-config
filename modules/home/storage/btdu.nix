{ config, lib, pkgs, ... }: {
  options.kappeh.storage.btdu.enable = lib.mkEnableOption "Enable btdu";

  config = lib.mkIf config.kappeh.storage.btdu.enable {
    home.packages = [ pkgs.btdu ];
  };
}

