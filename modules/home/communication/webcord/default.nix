{ config, lib, pkgs, ... }: {
  options.kappeh.communication.webcord.enable = lib.mkEnableOption "Enable WebCord";

  config = lib.mkIf config.kappeh.communication.webcord.enable {
    home = {
      persistence."/persist".directories = [ ".config/WebCord" ];

      file.webcord_theme = {
        source = ./calvera_dark.theme.css;
        target = ".config/WebCord/Themes/calvera_dark.theme.css";
      };

      packages = [ pkgs.webcord ];
    };
  };
}

