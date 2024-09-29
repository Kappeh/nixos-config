{ ... }: {
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
        border_width = 0;
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

    # extraConfig = builtins.readFile ./sxhkdrc;

    keybindings = {
      # Make sxhkd reload its configuration files
      "super + Escape" = "pkill -USR1 -x sxhkd";
      # Open terminal emulator
      "super + Return" = "alacritty";
      # Open program launcher
      "super + @space" = "rofi -show drun";
      # Globally disable middle-click pasting behaviour
      "~button2" = ";echo -n | xclip -in";

      # Open file manager
      "super + e" = "alacritty -e yazi";

      # Take a screenshot of the whole screen
      "Print" = "scrot ~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png";
      # Take a screenshot of the focused window
      "shift + Print" = "scrot -u ~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png";
      # Open screenshot gui
      "super + shift + s" = "flameshot gui";

      # Open clipboard history
      "super + c" = "clipcat-menu";

      # Media Controls
      "XF86AudioPlay" = "playerctl play-pause";
      "XF86AudioNext" = "playerctl next";
      "XF86AudioPrev" = "playerctl previous";

      # Audio Controls (TODO)
      # XF86AudioMute
      # XF86AudioLowerVolume
      # XF86AudioRaiseVolume

      # Quit bspwm
      "super + alt + q" = "bspc quit";
      # Restart bspwm
      "super + alt + r" = "bspc wm -r";
      # Close focused window
      "super + w" = "bspc node -c";
      # Kill focused window
      "super + shift + w" = "bspc node -k";
      # Toggle monocle layout
      "super + m" = "bspc desktop -l next";

      # Set focused window state to tiled
      "super + t" = "bspc node -t tiled";
      # Set focused window state to pseudo tiled
      "super + shift + t" = "bspc node -t pseudo_tiled";
      # Set focused window state to floating (stacking)
      "super + s" = "bspc node -t floating";
      # Set focused window state to fullscreen (stacking)
      "super + f" = "bspc node -t fullscreen";

      # Focus the node to the west
      "super + h" = "bspc node -f west";
      # Focus the node to the south
      "super + j" = "bspc node -f south";
      # Focus the node to the north
      "super + k" = "bspc node -f north";
      # Focus the node to the east
      "super + l" = "bspc node -f east";
      # Move focused node west
      "super + shift + h" = "bspc node -s west";
      # Move focused node south
      "super + shift + j" = "bspc node -s south";
      # Move focused node north
      "super + shift + k" = "bspc node -s north";
      # Move focused node east
      "super + shift + l" = "bspc node -s east";

      # Focus desktop
      "super + {1-9,0}" = "bspc desktop -f '^{1-9,10}'";
      # Send to desktop
      "super + shift + {1-9,0}" = "bspc node -d '^{1-9,10}'";
    };
  };
}
