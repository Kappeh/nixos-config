{ config, ... }: {
  config.programs.btop = {
    enable = true;

    settings = {
      color_theme = "tty";
      theme_background = false;
    };
  };
}
