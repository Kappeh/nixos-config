{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      "$mod" = "SUPER";

      "$terminal" = "alacritty";
      "$launcher" = "wofi";

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bind = [
        "$mod, Q, exec, hyprlock"
        "$mod SHIFT, Q, exec, pkill Hyprland"
        "$mod, W, killactive,"
        "$mod SHIFT, W, forcekillactive,"

        "$mod, Return, exec, $terminal"
        "$mod, Space, exec, $launcher"

        "$mod, t, settiled, active"
        "$mod, s, setfloating, active"
        "$mod, f, fullscreen, 0"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        "$mod SHIFT, h, layoutmsg, rollnext"
        "$mod SHIFT, l, layoutmsg, rollprev"
        "$mod SHIFT, k, layoutmsg, removemaster"
        "$mod SHIFT, j, layoutmsg, addmaster"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspacesilent, 1"
        "$mod SHIFT, 2, movetoworkspacesilent, 2"
        "$mod SHIFT, 3, movetoworkspacesilent, 3"
        "$mod SHIFT, 4, movetoworkspacesilent, 4"
        "$mod SHIFT, 5, movetoworkspacesilent, 5"
        "$mod SHIFT, 6, movetoworkspacesilent, 6"
        "$mod SHIFT, 7, movetoworkspacesilent, 7"
        "$mod SHIFT, 8, movetoworkspacesilent, 8"
        "$mod SHIFT, 9, movetoworkspacesilent, 9"
        "$mod SHIFT, 0, movetoworkspacesilent, 10"

        # Screenshot a region
        ", Print, exec, hyprshot --clipboard-only -m region"
        # Screenshot the active monitor
        "SHIFT, Print, exec, hyprshot --clipboard-only -m active -m output"
        # Open colour picker
        "$mod, Print, exec, hyprpicker --autocopy --format=hex --quiet"
        # Open clipboard manager
        "$mod, c, exec, cliphist list | wofi -S dmenu | cliphist decode | wl-copy"
        # Open bluetooth controls
        "$mod, b, exec, alacritty -e bluetui"
        # Open volume controls
        "$mod, v, exec, alacritty -e pulsemixer"
        # Open file manager (tui)
        "$mod, e, exec, alacritty -e yazi"
        # Open file manager (gui)
        "$mod SHIFT, e, exec, pcmanfm"
        # Restore recent notifications
        "$mod, n, exec, makoctl restore"
        # Open power menu
        "$mod, p, exec, wofi-power-menu"
      ];

      bindl = [
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"

        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
      ];

      bindle = [
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+"
      ];
    };
  };
}
