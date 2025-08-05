{ config, pkgs, ... }: {
  config.home = {
    packages = with pkgs; [
      libsForQt5.qt5ct
      kdePackages.qt6ct
    ];
    
    persistence."/persist/home/kieran".directories = [
      ".config/qt5ct"
      ".config/qt6ct"
    ];
  };
}
