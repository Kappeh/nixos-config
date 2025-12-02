{ config, lib, osConfig,... }: {
  imports = [
    ./animations.nix
    ./binds.nix
    ./hyprlock.nix
    # ./hyprpaper.nix
    ./hyprpicker.nix
    ./hyprpolkitagent.nix
    ./hyprshot.nix
    ./windowrules.nix
  ];

  options.myModules.desktop.hyprland.enable = lib.mkEnableOption "Enable Hyprland";

  config = {
    # Disable Hyprland Home Manager module if NixOS module is disabled
    myModules = lib.mkIf (!osConfig.myModules.desktop.hyprland.enable) {
      desktop.hyprland.enable = lib.mkForce false;
    };

    wayland.windowManager.hyprland = lib.mkIf config.myModules.desktop.hyprland.enable {
      enable = true;
      xwayland.enable = true;

      systemd.enable = true;

      settings = {
        general = {
          border_size = 2;
          layout = "master";
        };

        master = {
          allow_small_split = true;
          mfact = 0.60;
        };

        decoration = {
          blur.enabled = false;
          shadow.enabled = false;
        };

        animations = {
          enabled = true;

          # Appears to have been removed
          # first_launch_animation = true;
        };

        input = {
          kb_layout = "gb";
          kb_options = "eurosign:4,caps:escape";
          numlock_by_default = true;
          follow_mouse = 2;
          repeat_rate = 50;
          repeat_delay = 200;
        };

        # TODO make configurable
        device = [{
          name = "wacom-intuos-s-pen";
          output = "HDMI-A-1";
        }];

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          middle_click_paste = false;
        };

        ecosystem = {
          no_update_news = true;
          no_donation_nag = true;
        };

        # TODO make configurable
        monitor = [
          "DP-2, 1920x1080, 0x0, 1"
          "HDMI-A-1, 2560x1080, 1920x0, 1"
        ];

        # TODO make configurable
        workspace = [
          "1, monitor:DP-2"
          "2, monitor:DP-2"
          "3, monitor:DP-2"
          "4, monitor:DP-2"
          "5, monitor:DP-2"
          "6, monitor:HDMI-A-1"
          "7, monitor:HDMI-A-1"
          "8, monitor:HDMI-A-1"
          "9, monitor:HDMI-A-1"
          "10, monitor:HDMI-A-1"
        ];

        exec-once = [
          "systemctl --user start hyprpolkitagent"
          "waybar"
          "hyprpaper"
          "wl-clip-persist --clipboard regular --write-timeout 1000"
        ];

        # TODO switch nvidia specific environment variables based on enable option
        env = [
          # https://wiki.hyprland.org/Configuring/Environment-variables/
          # Currently disabled due to flickering in electron apps
          # "NIXOS_OZONE_WL,1"
          # Optional, hint Electron apps to use Wayland:
          # "ELECTRON_OZONE_PLATFORM_HINT,wayland"

          "WLR_RENDERER_ALLOW_SOFTWARE,1"
          "WLR_NO_HARDWARE_CURSORS,1"

          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XDG_SESSION_DESKTOP,Hyprland"

          "QT_AUTO_SCREEN_SCALE_FACTOR,1"
          "QT_QPA_PLATFORM,wayland;xcb"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
          # "QT_QPA_PLATFORMTHEME,qt6ct"

          "GBM_BACKEND,nvidia-drm"
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          "LIBVA_DRIVER_NAME,nvidia"

          "NVD_BACKEND,direct"
        ];
      };
    };
  };
}
