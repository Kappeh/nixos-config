{ config, ... }: {
  config.services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ "/home/kieran/Pictures/Wallpaper" ];

      wallpaper = [
        "DP-2,/home/kieran/Pictures/Wallpaper"
        "HDMI-A-1,/home/kieran/Pictures/Wallpaper"
      ];
    };
  };
}
