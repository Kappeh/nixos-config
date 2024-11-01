#==========================================================
#
#
#   ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗
#   ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
#   ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝
#   ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
#   ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║
#   ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
#
#
#   To learn more about how to configure Polybar
#   go to https://github.com/polybar/polybar
#
#   The README contains a lot of information
#
#==========================================================

{ config, pkgs, ... }: {
  config.services.polybar = {
    enable = true;
    script = "polybar top &";
    package = pkgs.polybarFull;
    config = {
      "colors" = {
        background = "#aa1b2230";
        background-alt = "#aa2d3b56";
        foreground = "#c5c8c6";
        primary = "#86d1f4";
        secondary = "#465e7a";
        alert = "#a54242";
        disabled = "#707880";
      };
      "bar/top" = {
        monitor = "\${env:MONITOR:DP-2}";

        width = "100%";
        height = "24pt";
        # radius = 6;

        background = "\${colors.background}";
        foreground = "\${colors.foreground}";

        line-size = "3pt";

        # border-size = "4pt";
        # border-color = "#000000";

        padding-left = 0;
        padding-right = 1;

        module-margin = 1;

        seperator = "|";
        seperator-foreground = "\${colors.disabled}";

        font-0 = "monospace;2";
        font-1 = "Symbols Nerd Font Mono;2";

        modules-left = "icon xworkspaces";
        modules-center = "xwindow";
        modules-right = "cpu memory eth date";

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";

        enable-ipc = true;

        override-redirect = false;
        wm-restack = "bspwm";
      };
      "module/icon" = {
        type = "custom/text";

        format = "<label>";
        format-background = "\${colors.background}";
        format-foreground = "\${colors.primary}";
        format-padding = 0;

        label = "  󱄅";
      };
      "module/xworkspaces" = {
        type = "internal/xworkspaces";

        pin-workspaces = false;
        group-by-monitor = true;
        enable-click = true;
        enable-scroll = false;

        label-active = "%name%";
        label-active-background = "\${colors.background-alt}";
        label-active-underline = "\${colors.primary}";
        label-active-padding = 1;

        label-occupied = "%name%";
        label-occupied-underline = "\${colors.secondary}";
        label-occupied-padding = 1;

        label-urgent = "%name%";
        label-urgent-background = "\${colors.alert}";
        label-urgent-padding = 1;

        label-empty = "%name%";
        label-empty-foreground = "\${colors.disabled}";
        label-empty-padding = 1;
      };
      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%class:0:60:...%";
      };
      "module/cpu" = {
        type = "internal/cpu";
        interval = "2";
        format-prefix = "󰾆 ";
        format-prefix-foreground = "\${colors.primary}";
        label = "%percentage:2%%";
      };
      "module/memory" = {
        type = "internal/memory";
        interval = "2";
        format-prefix = " ";
        format-prefix-foreground = "\${colors.primary}";
        label = "%percentage_used:2%%";
      };
      "module/eth" = {
        type = "internal/network";
        interface = "enp3s0";
        interface-type = "wired";
        interval = "5.0";
        accumulate-stats = false;

        format-connected = "<label-connected>";
        format-disconnected = "<label-disconnected>";

        label-connected = "%{F#86d1f4}󰄿%{F-} %upspeed% %{F#86d1f4}󰄼%{F-} %downspeed%";
        label-disconnected = "%{F#86d1f4}󰤮%{F-}";
      };
      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%{F#86d1f4}%A%{F-} %d/%m/%Y";
        time = "%H:%M:%S";
        label = "%date% %time%";
      };
      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = false;
      };
    };
  };
}
