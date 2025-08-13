{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.editors.idea.enable = lib.mkEnableOption "Enable IntelliJ IDEA";

  config = lib.mkIf config.myModules.applications.editors.idea.enable {
    home = {
      packages = [ pkgs.jetbrains.idea-community ];

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [
          ".config/JetBrains"
          ".local/share/JetBrains"
        ];
      };
    };
  };
}
