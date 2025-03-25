{ config, ... }: {
  config.programs.btop = {
    enable = true;

    settings = {
      color_theme = "TTY";
      theme_background = false;
      cpu_single_graph = true;
    };
  };
}
