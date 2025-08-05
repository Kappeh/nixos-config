{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.jetbrains.idea-community ];
    
    persistence."/persist/home/kieran".directories = [
      ".config/JetBrains"
      ".local/share/JetBrains"
    ];
  };
}
