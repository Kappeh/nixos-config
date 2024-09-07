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

{ pkgs, ... }: {
  services.polybar = {
    enable = true;
    script = "polybar top &";
    package = pkgs.polybarFull;
    config = {
      "colors" = {
        background = "#282A2E";
        background-alt = "#373B41";
        foreground = "#C5C8C6";
        primary = "#86d1f4";
        secondary = "#92db96";
        alert = "#A54242";
        disabled = "#707880";
      };
      "bar/top" = {
        monitor = "\${env:MONITOR:HDMI-0}";

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

        modules-left = "xworkspaces xwindow";
        modules-right = "memory cpu eth date";

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";

        enable-ipc = true;

        override-redirect = false;
        wm-restack = "bspwm";
      };
      "module/systray" = {
        type = "internal/tray";

        format-margin = "8pt";
        tray-spacing = "16pt";
      };
      "module/xworkspaces" = {
        type = "internal/xworkspaces";

        label-active = "%name%";
        label-active-background = "\${colors.background-alt}";
        label-active-underline = "\${colors.primary}";
        label-active-padding = 1;

        label-occupied = "%name%";
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
        label = "%title:0:60:...%";
      };
      "module/memory" = {
        type = "internal/memory";
        interval = "2";
        format-prefix = "RAM ";
        format-prefix-foreground = "\${colors.primary}";
        label = "%percentage_used:2%%";
      };
      "module/cpu" = {
        type = "internal/cpu";
        interval = "2";
        format-prefix = "CPU ";
        format-prefix-foreground = "\${colors.primary}";
        label = "%percentage:2%%";
      };
      "module/eth" = {
        type = "internal/network";
        interval = "5";
        format-connected = "<label-connected>";
        format-disconnected = "<label-disconnected>";
        label-disconnected = "%{F#F0C674}%ifname%%{F#707880} disconnected";

        interface-type = "wired";
        label-connected = "%{F#86d1f4}%ifname%%{F-} %local_ip%";
      };
      "module/date" = {
        type = "internal/date";
        internal = 5;
        date = "%d/%m/%Y";
        time = "%H:%M:%S";
        label = "%date% %time%";
      };
      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = true;
      };
    };
  };
}
