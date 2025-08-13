{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.messaging.webcord.enable = lib.mkEnableOption "Enable WebCord";

  config = lib.mkIf config.myModules.applications.messaging.webcord.enable {
    home = {
      packages = [ pkgs.webcord ];

      file.webcord_theme = {
        source = ./calvera_dark.theme.css;
        target = ".config/WebCord/Themes/calvera_dark.theme.css";
      };

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [ ".config/WebCord" ];
      };
    };
  };
}
