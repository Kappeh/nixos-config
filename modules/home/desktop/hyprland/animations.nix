{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      bezier = [
        "easeOutCubic, 0.33, 1, 0.68, 1"
      ];

      animation = [
        "windows, 1, 2, easeOutCubic, popin 80%"
        "fade, 1, 2, easeOutCubic"
        "layers, 0"
        "workspaces, 1, 2, easeOutCubic, slidefade 20%"
      ];
    };
  };
}
