{ config, lib, pkgs, ... }: {
  options.kappeh.tools.xclip.enable = lib.mkEnableOption "Enable xclip";

  config = lib.mkIf config.kappeh.tools.xclip.enable {
    home.packages = [ pkgs.xclip ];
  };
}

