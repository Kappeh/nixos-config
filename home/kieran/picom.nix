{ ... }: {
  services.picom = {
    enable = true;

    settings = {
      #################################
      #
      # Backend
      #
      #################################

      # Backend to use: "xrender" or "glx".
      # GLX backend is typically much faster but depends on a sane driver.

      # backend = "xrender";
      # backend = "xr_glx_hybrid";
      backend = "glx";

      #################################
      #
      # GLX backend
      #
      #################################

      glx-no-stencil = true;

      # GLX backend: Copy unmodified regions from front buffer instead of redrawing them all.
      # My tests with nvidia-drivers show a 10% decrease in performance when the whole screen is modified,
      # but a 20% increase when only 1/4 is.
      # My tests on nouveau show terrible slowdown.
      # Useful with --glx-swap-method, as well.
      glx-copy-from-front = false;

      # GLX backend: Use MESA_copy_sub_buffer to do partial screen update.
      # My tests on nouveau shows a 200% performance boost when only 1/4 of the screen is updated.
      # May break VSync and is not available on some drivers.
      # Overrides --glx-copy-from-front.
      # glx-use-copysubbuffermesa = true;

      # GLX backend: Avoid rebinding pixmap on window damage.
      # Probably could improve performance on rapid window content changes, but is known to break things on some drivers (LLVMpipe).
      # Recommended if it works.

      glx-no-rebind-pixmap = true;

      use-damage = false;

      # Disabled to avoid artifacts painting under blur transparent windows.

      #################################
      #
      # Shadows
      #
      #################################

      # Enabled client-side shadows on windows.
      shadow = true;

      # The blur radius for shadows. (default 12)
      shadow-radius = 35;
      # The left offset for shadows. (default -15)
      # shadow-offset-x = -35;
      shadow-offset-x = -35;
      # The top offset for shadows. (default -15)
      # shadow-offset-y = -35;
      shadow-offset-y = -35;
      # The translucency for shadows. (default .75)
      shadow-opacity = 0.7;

      # Set if you want different colour shadows
      # shadow-red = 0.0;
      # shadow-green = 0.0;
      # shadow-blue = 0.0;

      # shadow-exclude-reg = "x10+0+0";
      # xinerama-shadow-crop = true;

      # The shadow exclude options are helpful if you have shadows enabled. Due to the way compton draws its shadows, certain applications will have visual glitches
      # (most applications are fine, only apps that do weird things with xshapes or argb are affected).
      # This list includes all the affected apps I found in my testing. The "! name~=''" part excludes
      # shadows on any "Unknown" windows, this prevents a visual glitch with the XFWM alt tab switcher.

      # shadow-exclude = "n:e:Notification";

      shadow-exclude = [
        "_GTK_FRAME_EXTENTS@:c"
        # Removed to avoid no-shadow in modal dialog windows.
        # "! name~=''",
        "name = 'Notification'"
        "name = 'Plank'"
        "name = 'Docky'"
        "name = 'Kupfer'"
        "name = 'Pensela'"
        "name = 'Drawing Board'"
        #
        # Workaround for VirtualBox empty window at launching
        "name = 'VirtualBox'"
        "name = 'VirtualBoxVM'"
        #
        # Avoid shadow in Negatron popups
        "name = 'Negatron v0.100.1' && argb"
        #
        # Avoid shadow for the XFCE alt tab TaskSwitcher
        "name ?= 'xfwm4' && argb"
        #
        # "name *= 'compton'",
        "class_g = 'Conky'"
        "class_g = 'Kupfer'"
        "class_g = 'Synapse'"
        "class_g ?= 'Notify-osd'"
        "class_g ?= 'Cairo-dock'"
        "class_g = 'Cairo-clock'"
        "class_g ?= 'Xfce4-notifyd'"
        #
        # Exclude special Firefox/Firefox-esr/Thunderbird dropdowns.
          # Ref: https://github.com/chjj/compton/issues/247
        "class_g = 'Thunderbird' && argb"
        "class_g = 'Telegram' && argb"
        "name ?= 'Thunderbird' && (window_type = 'utility' || window_type = 'popup_menu')"
        #
        # Exclude some special popup menu shadows, but Modal Windows.
        # These are more finetuning thant previous ones:
        "class_g ?= 'Thunderbird' && class_i = 'Popup' && argb"
        "class_g = 'firefox' && (window_type = 'utility' || window_type = 'popup_menu') && argb"
        "class_g = 'Firefox' && (window_type = 'utility' || window_type = 'popup_menu') && argb"
        "class_g = 'firefox-esr' && (window_type = 'utility' || window_type = 'popup_menu') && argb"
        "class_g = 'Firefox-esr' && (window_type = 'utility' || window_type = 'popup_menu') && argb"
        "class_g = 'Tor Browser' && (window_type = 'utility') && argb"
        "class_g = 'Navegador Tor' && (window_type = 'utility' || window_type = 'popup_menu') && argb"
        "class_g = 'Thunderbird' && (window_type = 'utility' || window_type = 'popup_menu') && argb"
        "class_g = 'Mozilla Thunderbird' && (window_type = 'utility' || window_type = 'popup_menu') && argb"
        "class_g ?= 'Xfce4-power-manager'"
        #
        # Exclude Vokoscreen and VokoscreenNG area selector
        #
        "class_g ?= 'vokoscreen' && argb"
        "name = 'Área'"
        "name *= 'Cuenta regresiva'"
        "_NET_WM_WINDOW_TYPE:a *= '_KDE_NET_WM_WINDOW_TYPE_OVERRIDE'"
        #	"override_redirect = true"
      ];
      # Avoid drawing shadow on all shaped windows (see also: --detect-rounded-corners)
      #  Deprecated, use --shadow-exclude 'bounding_shaped' or --shadow-exclude 'bounding_shaped && !rounded_corners' instead.
      shadow-ignore-shaped = false;

      #################################
      #
      # Opacity
      #
      #################################

      inactive-opacity = 0.8;
      active-opacity = 1;
      frame-opacity = 1;
      inactive-opacity-override = false;

      opacity-exclude = [
        "name = 'Stratagus'"
      ];

      # Desaturate and darken the inactive windows
      # Dim inactive windows. (0.0 - 1.0)

      # inactive-dim = 0.2;
      # inactive-dim-fixed = true;

      # Do not let dimness adjust based on window opacity.
      # inactive-dim-fixed = true;

      # Blur background of transparent windows. Bad performance with X Render backend. GLX backend is preferred.

      blur = true;
      blur-background = true;
      blur-method = "dual_kawase";
      blur-radius = 10;
      blur-strength = 5;

      # Blur background of opaque windows with transparent frames as well.
      # blur-background-frame = true;
      # Do not let blur radius adjust based on window opacity.
      # blur-background-fixed = true;

      # blur-kern = "3x3box";
      # blur-kern = "5x5box";
      # blur-kern = "5x5gaussian";
      # blur-kern = "9x9gaussian";

      blur-background-exclude = [
        "class_g = 'Peek'"
        "class_g = 'Pensela'"
        "name = 'Drawing Board'"
        "window_type = 'dock'"
        "window_type = 'dropdown_menu'"
        "window_type = 'combo'"
        "window_type = 'popup_menu'"
        "window_type = 'utility'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
      ];

      #################################
      #
      # Fading
      #
      #################################

      fading = false;
      # fade-delta = 30;
      # fade-in-step = 0.03;
      # fade-out-step = 0.03;
      # fade-in-step = 0.07;
      # fade-out-step = 0.07;
      # no-fading-openclose = true;
      # no-fading-destroyed-argb = true;
      # fade-exclude = [ ];

      #################################
      #
      # OTHER CONFIG
      #
      #################################

      log-level = "warn";
      # log-file = "/path/to/your/log/file";

      mark-wmwin-focused = true;
      mark-ovredir-focused = false;
      # use-ewmh-active-win = true;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      # refresh-rate = 0;

      # vsync = true;

      # sw-opti = true;
      # unredir-if-possible = true;
      # unredir-if-possible-delay = 5000;
      # unredir-if-possible-exclude = [ ];

      focus-exclude = [ "class_g = 'Cairo-clock'" ];

      detect-transient = true;
      detect-client-leader = true;
      invert-color-include = [ ];

      resize-damage = 2;

      #################################
      #
      # Window type settings
      #
      #################################
      wintypes = {
        # normal = { opacity = 0.9; };
        dock = { shadow = true; };
        dnd = { shadow = false; };
        popup_menu = { opacity = 1; };
        dropdown_menu = { opacity = 1; };

        # This avoid problems with transparent windows while use-damage = true;.
        # normal = { full-shadow = true;};

        #   tooltip = { fade = true; shadow = true; opacity = 0.75; focus = true; full-shadow = false; };
      };
    };
  };
}
