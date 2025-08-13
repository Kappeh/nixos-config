{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.hyprland.enable {
    services.hyprpaper = {
      enable = true;

      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [ "/home/${config.home.username}/Pictures/Wallpaper" ];

        # TODO make configurable
        wallpaper = [
          "DP-2,/home/${config.home.username}/Pictures/Wallpaper"
          "HDMI-A-1,/home/${config.home.username}/Pictures/Wallpaper"
        ];
      };
    };
  };
}
