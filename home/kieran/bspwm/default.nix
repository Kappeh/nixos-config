{ config, ... }: {
  config = {
    xsession = {
      enable = true;

      numlock.enable = true;

      windowManager.bspwm = {
        enable = true;

        alwaysResetDesktops = true;
        monitors = {
          "DP-2" = [ "1" "2" "3" "4" "5" ];
          "HDMI-0" = [ "6" "7" "8" "9" "0" ];
        };

        settings = {
          border_width = 1;
          normal_border_color = "#465e7a";
          focused_border_color = "#86d1f4";
          window_gap = 12;
          split_ratio = 0.52;
          borderless_monocle = true;
          gapless_monocle = true;
        };

        rules = {
          Gimp = { state = "floating"; follow = true; };
          # Fix firefox rules. For some reason setting `browser.tabs.inTitlebar`
          # to `0` (to remove the border around the window) makes bspwm start
          # firefox in `floating` mode.
          firefox = { state = "tiled"; };
        };

        extraConfig = builtins.readFile ./bspwmrc;
      };
    };

    services.sxhkd = {
      enable = true;

      keybindings = {
        # Restart sxhkd
        "super + Escape" = "pkill -USR1 -x sxhkd";

        # Quit bspwm
        "super + alt + q" = "bspc quit";
        # Restart bspwm
        "super + alt + r" = "bspc wm -r";
        # Close focused window
        "super + w" = "bspc node -c";
        # Kill focused window
        "super + shift + w" = "bspc node -k";

        # Window state
        #
        # Set focused window state to tiled
        "super + t" = "bspc node -t tiled";
        # Set focused window state to pseudo tiled
        "super + shift + t" = "bspc node -t pseudo_tiled";
        # Set focused window state to floating (stacking)
        "super + s" = "bspc node -t floating";
        # Set focused window state to fullscreen (stacking)
        "super + f" = "bspc node -t fullscreen";
        # Toggle monocle layout (toggle fullscreen)
        "super + shift + f" = "bspc desktop -l next";

        # Focus
        #
        # Focus in the direction
        "super + h" = "bspc node -f west";
        "super + j" = "bspc node -f south";
        "super + k" = "bspc node -f north";
        "super + l" = "bspc node -f east";
        # Focus desktop
        "super + {1-9,0}" = "bspc desktop -f '^{1-9,10}'";

        # Move
        #
        # Move focused node
        "super + shift + h" = "bspc node -s west";
        "super + shift + j" = "bspc node -s south";
        "super + shift + k" = "bspc node -s north";
        "super + shift + l" = "bspc node -s east";
        # Move to desktop
        "super + shift + {1-9,0}" = "bspc node -d '^{1-9,10}'";
        # Move a floating window
        "super + Left" = "bspc node -v -20 0";
        "super + Down" = "bspc node -v 0 20";
        "super + Up" = "bspc node -v 0 -20";
        "super + Right" = "bspc node -v 20 0";
        # Focus previous desktop
        "super + grave" = "bspc desktop -f last";
        # Focus previous node
        "super + Tab" = "bspc node -f last";
        # Focus older or newer node in the focus history
        "super + i" = "bspc wm -h off; bspc node older -f; bspc wm -h on";
        "super + o" = "bspc wm -h off; bspc node newer -f; bspc wm -h on";

        # Resize
        #
        # Expand window in direction
        "super + alt + h" = "bspc node -z left -20 0";
        "super + alt + j" = "bspc node -z bottom 0 20";
        "super + alt + k" = "bspc node -z top 0 -20";
        "super + alt + l" = "bspc node -z right 20 0";
        # Contract window in direction
        "super + ctrl + alt + h" = "bspc node -z right -20 0";
        "super + ctrl + alt + j" = "bspc node -z top 0 20";
        "super + ctrl + alt + k" = "bspc node -z bottom 0 -20";
        "super + ctrl + alt + l" = "bspc node -z left 20 0";

        # Preselect
        #
        # Preselect in the direction
        "super + ctrl + h" = "bspc node -p west";
        "super + ctrl + j" = "bspc node -p south";
        "super + ctrl + k" = "bspc node -p north";
        "super + ctrl + l" = "bspc node -p east";
        # Preselect Raio
        "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";
        # Cancel Preselect
        "super + ctrl + space" = "bspc node -p cancel";

        # Media Controls
        #
        "XF86AudioPlay" = "playerctl play-pause";
        "XF86AudioNext" = "playerctl next";
        "XF86AudioPrev" = "playerctl previous";

        # Audio Controls (TODO)
        #
        # XF86AudioMute
        # XF86AudioLowerVolume
        # XF86AudioRaiseVolume

        # Screenshot
        #
        # Take a screenshot of the whole screen
        "Print" = "scrot ~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png";
        # Take a screenshot of the focused window
        "shift + Print" = "scrot -u ~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png";
        # Open screenshot gui
        "super + shift + s" = "flameshot gui";

        # Programs
        #
        # Terminal Emulator
        "super + Return" = "alacritty";
        # Program Launcher
        "super + @space" = "rofi -show drun";
        # Clipboard Manager
        "super + c" = "clipcat-menu";
        # File Manager
        "super + e" = "alacritty -e yazi";
        # Bluetooth Manager
        "super + b" = "alacritty -e bluetui";
        # Volume Control
        "super + v" = "alacritty -e pulsemixer";
        # Calclator
        "super + q" = "rofi -show calc -modi calc -no-show-match -no-sort > /dev/null";

        # Scripts
        #
        # Mount device
        "super + m" = "rofi_mount";

        # Misc
        #
        # Globally disable middle-click pasting behaviour
        "~button2" = ";echo -n | xclip -in";
      };
    };
  };
}
