{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      windowrulev2 = [
        # Discord
        "workspace 2, class:(discord)"

         # Balatro
        "fullscreen, class:(steam_app_2379780)"

        # Overwatch
        "fullscreen, class:(steam_app_2357570)"
        "monitor HDMI-A-1, class:(steam_app_2357570)"

        # KeePassXC
        "workspace 5, class:(org.keepassxc.KeePassXC)"
        # KeePassXC - Browser Access Request
        "float, class:(org.keepassxc.KeePassXC), title:(KeePassXC - Browser Access Request)"
        "pin, class:(org.keepassxc.KeePassXC), title:(KeePassXC - Browser Access Request)"
        "center (1), class:(org.keepassxc.KeePassXC), title:(KeePassXC - Browser Access Request)"
        "noinitialfocus, class:(org.keepassxc.KeePassXC), title:(KeePassXC - Browser Access Request)"

        # ssh-askpass-fullscreen
        "fullscreen, class:(Ssh-askpass-fullscreen), title:(ssh-askpass-fullscreen)"

        # Feishin
        "workspace 4, class:(feishin), title:(Feishin)"

        # Steam
        "tile, class:(steam)"
        "workspace 10, class:(steam)"
      ];
    };
  };
}
