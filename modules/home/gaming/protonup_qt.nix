{ config, lib, pkgs, ... }: {
  options.kappeh.gaming.protonup_qt.enable = lib.mkEnableOption "Enable ProtonUp-Qt";

  config = lib.mkIf config.kappeh.gaming.protonup_qt.enable {
    home.packages = [ pkgs.protonup-qt ];
  };
}

