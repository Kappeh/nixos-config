{ config, pkgs, ... }: {
  config.home.packages = with pkgs; [
    kdePackages.qt6ct
    libsForQt5.qt5ct
  ];
}
