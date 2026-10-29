{ config, lib, pkgs, ... }: {
  options.kappeh.hardware.framework.enable = lib.mkEnableOption "Enable Framework tools";

  config = lib.mkIf config.kappeh.hardware.framework.enable {
    home.packages = [
      pkgs.framework-tool
      pkgs.framework-tool-tui
    ];
  };
}

