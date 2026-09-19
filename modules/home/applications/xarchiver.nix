{ config, lib, pkgs, ... }: {
  options.kappeh.applications.xarchiver.enable = lib.mkEnableOption "Enable Xarchiver";

  config = lib.mkIf config.kappeh.applications.xarchiver.enable {
    home.packages = [ pkgs.xarchiver ];
  };
}

