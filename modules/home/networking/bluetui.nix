{ config, lib, pkgs, ... }: {
  options.kappeh.networking.bluetui.enable = lib.mkEnableOption "Enable bluetui";

  config = lib.mkIf config.kappeh.networking.bluetui.enable {
    home.packages = [ pkgs.bluetui ];
  };
}

