{ config, lib, pkgs, ... }: {
  options.kappeh.shell.zip.enable = lib.mkEnableOption "Enable zip";

  config = lib.mkIf config.kappeh.shell.zip.enable {
    home.packages = [ pkgs.zip ];
  };
}

