{ config, lib, pkgs, ... }: {
  options.kappeh.shell.ripgrep.enable = lib.mkEnableOption "Enable ripgrep";

  config = lib.mkIf config.kappeh.shell.ripgrep.enable {
    home.packages = [ pkgs.ripgrep ];
  };
}

