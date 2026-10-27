{ lib, ... }: {
  options.kappeh.desktop = {
    monitors = lib.mkOption {
      description = "Monitor configuration for this device.";

      type = lib.types.listOf (lib.types.submodule {
        options = {
          output = lib.mkOption {
            type = lib.types.str;
            description = "Hyprland output name.";
          };

          mode = lib.mkOption {
            type = lib.types.str;
            description = "Resolution and refresh rate, e.g. 1920x1080@60.";
          };

          position = lib.mkOption {
            type = lib.types.str;
            default = "0x0";
          };

          scale = lib.mkOption {
            type = lib.types.str;
            default = "1";
          };

          workspaces = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
            description = "Workspaces assigned to this monitor.";
          };
        };
      });

      default = [];
    };

    barOutput = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "Monitor output used for Waybar.";
    };

    notificationOutput = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "Monitor output used for Mako notifications.";
    };
  };
}

