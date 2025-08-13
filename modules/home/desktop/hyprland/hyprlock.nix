{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.hyprland.enable {
    programs.hyprlock = {
      enable = true;

      settings = {
        general = {
          immediate_render = true;
          hide_cursor = true;
        };
        animations.enabled = true;
        background = [{
          color = "rgb(000000)";
        }];
        input-field = [{
          size = "200, 50";

          font_color = "rgb(82AAFF)";
          inner_color = "rgb(222222)";
          outer_color = "rgb(222222)";
          check_color = "rgb(82AAFF)";
          fail_color = "rgb(e97a7a)";
          outline_thickness = 1;

          fade_on_empty = true;
          fade_timeout = 100;
          placeholder_text = "";
          fail_text = "";
        }];

        animations = {
          bezier = [
            "easeOutCubic, 0.33, 1, 0.68, 1"
          ];
          animation = [
            "fadeIn, 1, 2, easeOutCubic"
            "fadeOut, 1, 2, easeOutCubic"
            "inputFieldColors, 0"
            "inputFieldFade, 1, 2, easeOutCubic"
            "inputFieldWidth, 1, 2, easeOutCubic"
            "inputFieldDots, 1, 2, easeOutCubic"
          ];
        };
      };
    };
  };
}
