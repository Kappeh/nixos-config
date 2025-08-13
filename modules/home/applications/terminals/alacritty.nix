{ config, lib, ... }: {
  options.myModules.applications.terminals.alacritty.enable = lib.mkEnableOption "Enable Alacritty";

  config = lib.mkIf config.myModules.applications.terminals.alacritty.enable {
    programs.alacritty = {
      enable = true;

      settings = {
        window = {
          opacity = 1.0;
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
        colors = {
          primary = {
            foreground = "#b1b9f1";
            background = "#14142c";
            dim_foreground = "#44447e";
            bright_foreground = "#9e9edf";
          };
          normal = {
            black = "#252549";
            red = "#ff5370";
            green = "#58dd80";
            yellow = "#f0af74";
            blue = "#537bd2";
            magenta = "#8473de";
            cyan = "#45c8c5";
            white = "#747495";
          };
          bright = {
            black = "#44447e";
            red = "#e97a7a";
            green = "#8af193";
            yellow = "#d6b295";
            blue = "#90afff";
            magenta = "#9f96eb";
            cyan = "#8cdac9";
            white = "#d8d8ff";
          };
        };
        font.size = 10;
      };
    };
  };
}
