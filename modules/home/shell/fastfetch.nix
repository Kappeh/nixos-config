{ config, lib, pkgs, ... }: {
  options.kappeh.shell.fastfetch.enable = lib.mkEnableOption "Enable fastfetch";

  config = lib.mkIf config.kappeh.shell.fastfetch.enable {
    home.packages = [ pkgs.fastfetch ];
  };
}

