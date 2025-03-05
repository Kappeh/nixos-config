{ config, ... }: {
  config.programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      output = [ "DP-2" ];

      modules-left = [
        "hyprland/workspaces"
      ];

      modules-center = [
        "hyprland/window"
      ];

      modules-right = [
        "group/hardware"
        "network"
        "clock"
      ];

      "group/hardware" = {
        orientation = "horizontal";
        modules = [
          "cpu"
          "memory"
        ];
      };

      "hyprland/workspaces" = {
        all-outputs = true;
        active-only = false;
      };
    };
  };
}
