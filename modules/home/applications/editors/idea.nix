{ config, lib, pkgs, ... }: {
  options.myModules.applications.editors.idea.enable = lib.mkEnableOption "Enable IntelliJ IDEA";

  config = lib.mkIf config.myModules.applications.editors.idea.enable {
    home = {
      packages = [ pkgs.jetbrains.idea-community ];

      persistence."/persist/home/${config.home.username}".directories = [
        ".config/JetBrains"
        ".local/share/JetBrains"
      ];
    };
  };
}
