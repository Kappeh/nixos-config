{ config, ... }: {
  config.programs.waybar = {
    enable = true;

    style = builtins.readFile ./style.css;

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      output = [ "DP-2" ];
      spacing = 0;
      fixed-center = false;

      reload_style_on_change = false;

      modules-left = [
        "custom/nixos-icon"
        "hyprland/workspaces"
      ];

      modules-center = [
        "hyprland/window"
      ];

      modules-right = [
        "cpu"
        "memory"
        "disk"
        "network"
        "bluetooth"
        "wireplumber"
        "clock"
      ];

      "custom/nixos-icon" = {
        format = "";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        all-outputs = true;
        active-only = false;
      };

      "hyprland/window" = {
        tooltip = false;
      };

      cpu = {
        format = " {usage}%";
        tooltip = false;
        interval = 1;
      };

      memory = {
        format = " {used:0.1f}GiB    {swapUsed:0.1f}GiB";
        tooltip = false;
        interval = 1;
      };

      disk = {
        format = " {percentage_used}%";
        tooltip = false;
      };

      network = {
        format-wifi = "";
        format-ethernet = "";
        format-disconnected = "󱘖";
        tooltip = false;
      };

      bluetooth = {
        format-disabled = "";
        format-off = "";
        format-on = "";
        format-connected = " {num_connections}";
        tooltip = false;
      };

      wireplumber = {
        format = "{icon} {volume}%";
        format-muted = "";
        format-icons = [ "" "" "" ];
        tooltip = false;
      };

      clock = {
        format = " {:%A %d/%m/%Y %H:%M:%S}";
        tooltip = false;
        timezone = "Etc/GMT";
        interval = 1;
      };
    };
  };
}
