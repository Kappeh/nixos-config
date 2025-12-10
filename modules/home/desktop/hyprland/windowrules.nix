{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        # Discord
        # "workspace 2, class:discord"
        "workspace 2, match:class discord"

         # Balatro
        "fullscreen on, match:class steam_app_2379780"

        # Overwatch
        "monitor HDMI-A-1, fullscreen on, match:class steam_app_2357570"

        # KeePassXC
        "workspace 5, match:class org.keepassxc.KeePassXC"
        # KeePassXC - Browser Access Request
        "float on, pin on, center on, no_initial_focus on, match:class org.keepassxc.KeePassXC, match:title KeePassXC - Browser Access Request"

        # ssh-askpass-fullscreen
        "fullscreen on, match:class Ssh-askpass-fullscreen, match:title ssh-askpass-fullscreen"

        # Feishin
        "workspace 4, match:class feishin, match:title Feishin"

        # Steam
        "workspace 10, match:class steam"
      ];
    };
  };
}

