{ config, lib, pkgs, ... }: {
  options.kappeh.shell.unzip.enable = lib.mkEnableOption "Enable unzip";

  config = lib.mkIf config.kappeh.shell.unzip.enable {
    home.packages = [ pkgs.unzip ];
  };
}

