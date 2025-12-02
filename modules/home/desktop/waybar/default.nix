{ config, lib, pkgs, ... }: {
  options.myModules.desktop.waybar.enable = lib.mkEnableOption "Enable Waybar";

  config = lib.mkIf config.myModules.desktop.waybar.enable {
    stylix.targets.waybar.enable = false;

    home.packages = [ pkgs.waybar-mpris ];

    programs.waybar = {
      enable = true;

      style = pkgs.replaceVars ./style.css {
        base00 = config.lib.stylix.colors.base00;
        base01 = config.lib.stylix.colors.base01;
        base03 = config.lib.stylix.colors.base03;
        base05 = config.lib.stylix.colors.base05;
        base08 = config.lib.stylix.colors.base08;
        base09 = config.lib.stylix.colors.base09;
        base0A = config.lib.stylix.colors.base0A;
        base0B = config.lib.stylix.colors.base0B;
        base0C = config.lib.stylix.colors.base0C;
        base0D = config.lib.stylix.colors.base0D;
        base0E = config.lib.stylix.colors.base0E;
      };

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
          "custom/waybar-mpris"
        ];

        modules-right = [
          "cpu"
          "memory"
          "disk#raid"
          # "disk#storage"
          "network"
          "bluetooth"
          "upower#controller"
          "wireplumber"
          "gamemode"
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

        "custom/waybar-mpris" = {
          return-type = "json";
          # Play and pause symbols are switched so that the current state is displayed instead
          exec = "waybar-mpris --position --autofocus --play  --pause ";
          on-click = "waybar-mpris --send toggle";
          on-scroll-up = "waybar-mpris --send player-next";
          on-scroll-down = "waybar-mpris --send player-prev";
        };

        cpu = {
          format = " {usage}%";
          tooltip = false;
          interval = 1;
        };

        memory = {
          # format = " {used:0.1f}GiB    {swapUsed:0.1f}GiB";
          format = " {used:0.1f}GiB";
          tooltip = false;
          interval = 1;
        };

        "disk#raid" = {
          path = "/raid_root";
          format = " {percentage_used}%";
          tooltip = false;
        };

        # "disk#storage" = {
        #   path = "/storage_root";
        #   format = " {percentage_used}%";
        #   tooltip = false;
        # };

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

        "upower#controller" = {
          native-path = "/org/bluez/hci0/dev_F8_67_B9_47_30_C9";

          show-icon = false;
          # icon-size = 20;
          tooltip = false;
          # tooltip-spacing = 4;
          # tooltip-padding = 4;

          format = "󰊴 {percentage}";
          # format-alt = "{percentage} {time}";
          hide-if-empty = true;
          on-click = "";
        };

        wireplumber = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = [ "" "" "" ];
          tooltip = false;
        };

        gamemode = {
          use-icon = false;
          icon-size = 0;
          icon-spacing = 0;
          format = "";
          format-alt = "";
          tooltip = false;
        };

        clock = {
          format = " {:%A %d/%m/%Y %H:%M:%S}";
          tooltip = false;
          timezone = "Europe/London";
          interval = 1;
        };
      };
    };
  };
}
