{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.webcord ];

    persistence."/persist/home/kieran".directories = [
      ".config/WebCord"
    ];

    file.webcord_theme = {
      source = ./calvera_dark.theme.css;
      target = ".config/WebCord/Themes/calvera_dark.theme.css";
    };
  };
}
