{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        # Discord
        "match:class discord, workspace 2"

        # Balatro
        "match:class steam_app_2379780, fullscreen on"

        # Overwatch
        "match:class steam_app_2357570, monitor HDMI-A-1, fullscreen on"

        {
          name = "keepassxc-workspace-5";
          match.class = "org.keepassxc.KeePassXC";
          workspace = 5;
        }

        {
          name = "keepassxc-access-request";
          match.initial_title = "KeePassXC -  Access Request";
          float = true;
          pin = true;
          center = true;
          no_initial_focus = true;
          size = "monitor_w*0.8 monitor_h*0.8";
        }

        {
          name = "keepassxc-browser-access-request";
          match.initial_title = "KeePassXC - Browser Access Request";
          float = true;
          pin = true;
          center = true;
          no_initial_focus = true;
        }

        # ssh-askpass-fullscreen
        "match:class Ssh-askpass-fullscreen, match:title ssh-askpass-fullscreen, fullscreen on"

        # Feishin
        "match:class feishin, match:title Feishin, workspace 4"

        # Steam
        "match:class steam, workspace 10"
      ];
    };
  };
}

