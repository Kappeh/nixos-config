{ config, lib, pkgs, ... }: {
  options.kappeh.gaming.protontricks.enable = lib.mkEnableOption "Enable ProtonTricks";

  config = lib.mkIf config.kappeh.gaming.protontricks.enable {
    home.packages = [ pkgs.protontricks ];
  };
}

