{ config, ... }: {
  config.programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.8;
        padding = { x = 20; y = 20; };
        # dynamic_padding = true;
      };
      scrolling = {
        multiplier = 1;
        history = 10000;
      };
      cursor.style = {
        shape = "Beam";
        blinking = "On";
      };
      colors.primary = {
        background = "#1b2230";
        foreground = "#c5c8c6";
        dim_foreground = "#707880";
      };
      font.size = 10;
    };
  };
}
