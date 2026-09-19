{ config, lib, pkgs, ... }: {
  options.kappeh.shell.tldr.enable = lib.mkEnableOption "Enable tldr";

  config = lib.mkIf config.kappeh.shell.tldr.enable {
    home.packages = [ pkgs.tldr ];
  };
}

