{ config, ... }: {
  config.programs.wofi = {
    enable = true;

    style = builtins.readFile ./calvera_dark.css;

    settings = {
      mode = "drun";
      allow_markup = false;
      allow_images = true;
      image_size = 32;
      term = "alacritty.desktop";
      orientation = "vertical";
      layer = "top";
      prompt = "";
      insensitive = true;
      no_actions = true;
    };
  };
}
