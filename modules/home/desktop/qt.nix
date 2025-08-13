{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.desktop.qt.enable = lib.mkEnableOption "Enable Qt";

  config = lib.mkIf config.myModules.desktop.qt.enable {
    home = {
      packages = with pkgs; [
        adwaita-qt
        adwaita-qt6
        libsForQt5.qt5ct
        kdePackages.qt6ct
      ];

      sessionVariables.QT_QPA_PLATFORMTHEME = "qt6ct";

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [
          ".config/qt5ct"
          ".config/qt6ct"
        ];
      };
    };
  };
}
