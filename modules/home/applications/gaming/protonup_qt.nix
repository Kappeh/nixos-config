{ config, lib, pkgs, ... }: {
  options.myModules.applications.gaming.protonup_qt.enable = lib.mkEnableOption "Enable ProtonUp-Qt";

  config = lib.mkIf config.myModules.applications.gaming.protonup_qt.enable {
    home.packages = [ pkgs.protonup-qt ];
  };
}
