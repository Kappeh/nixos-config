{ config, lib, pkgs, ... }: {
  options.myModules.desktop.wlr_which_key.enable = lib.mkEnableOption "Enable wlr-which-key";

  config = lib.mkIf config.myModules.desktop.wlr_which_key.enable {
    home.packages = [ pkgs.wlr-which-key ];

    xdg.configFile."wlr-which-key/config.yaml".source = (pkgs.formats.yaml { }).generate "something" {
      # Theming
      font = "${config.stylix.fonts.monospace.name} 12";
      background = "#${config.lib.stylix.colors.base00}";
      color = "#${config.lib.stylix.colors.base07}";
      border = "#${config.lib.stylix.colors.base0D}";
      separator = " ➜ ";
      border_width = 2;
      corner_r = 0;
      padding = 20;
      rows_per_column = 5;
      column_padding = 40;

      # Anchor and margin
      anchor = "center";
      # Only relevant when anchor is not center
      margin_right = 0;
      margin_bottom = 0;
      margin_left = 0;
      margin_top = 0;

      # namespace to use for the layer shell surface
      # namespace = "wlr_which_key";

      # Permits key bindings that conflict with compositor key bindings.
      # Default is `false`.
      # inhibit_compositor_keyboard_shortcuts = true;

      # Try to guess the correct keyboard layout to use. Default is `false`.
      auto_kbd_layout = true;

      menu = [
        {
          key = "c";
          desc = "Clipboard";
          submenu = [
            {
              key = "c";
              desc = "Clear";
              cmd = "cliphist wipe";
            }
            {
              key = "d";
              desc = "Delete";
              cmd = "cliphist list | rofi -dmenu | cliphist delete";
            }
            {
              key = "s";
              desc = "Search";
              cmd = "cliphist list | rofi -dmenu | cliphist decode | wl-copy";
            }
          ];
        }
        {
          key = "g";
          desc = "Games";
          submenu = [
            {
              key = "b";
              desc = "Balatro";
              cmd = "steam steam://rungameid/2379780";
            }
            {
              key = "c";
              desc = "Cogmind";
              cmd = "steam steam://rungameid/722730";
            }
            {
              key = "d";
              desc = "Dead by Daylight";
              cmd = "steam steam://rungameid/381210";
            }
            {
              key = "f";
              desc = "Factorio";
              cmd = "steam steam://rungameid/427520";
            }
            {
              key = "h";
              desc = "Haste";
              cmd = "steam steam://rungameid/1796470";
            }
            {
              key = "i";
              desc = "Tetrio";
              cmd = "tetrio";
            }
            {
              key = "k";
              desc = "Hollow Knight";
              cmd = "steam steam://rungameid/367520";
            }
            {
              key = "m";
              desc = "Minecraft";
              cmd = "prismlauncher";
            }
            {
              key = "o";
              desc = "Overwatch";
              cmd = "steam steam://rungameid/2357570";
            }
            {
              key = "p";
              desc = "Peak";
              cmd = "steam steam://rungameid/3527290";
            }
            {
              key = "s";
              desc = "Stardew Valley";
              cmd = "steam steam://rungameid/413150";
            }
            {
              key = "r";
              desc = "Terraria";
              cmd = "steam steam://rungameid/105600";
            }
            {
              key = "t";
              desc = "Trackmania";
              cmd = "steam steam://rungameid/2225070";
            }
            {
              key = "u";
              desc = "Undertale";
              cmd = "steam steam://rungameid/391540";
            }
            {
              key = "w";
              desc = "Webfishing";
              cmd = "steam steam://rungameid/3146520";
            }
            {
              key = "x";
              desc = "SuperTuxKart";
              cmd = "supertuxkart";
            }
          ];
        }
        {
          key = "p";
          desc = "Power";
          submenu = [
            {
              key = "s";
              desc = "Shutdown";
              submenu = [
                {
                  key = "y";
                  desc = "Confirm";
                  cmd = "systemctl poweroff";
                }
                {
                  key = "n";
                  desc = "Cancel";
                  cmd = "";
                }
              ];
            }
            {
              key = "r";
              desc = "Reboot";
              submenu = [
                {
                  key = "y";
                  desc = "Confirm";
                  cmd = "systemctl reboot";
                }
                {
                  key = "n";
                  desc = "Cancel";
                  cmd = "";
                }
              ];
            }
            {
              key = "q";
              desc = "Quit Hyprland";
              submenu = [
                {
                  key = "y";
                  desc = "Confirm";
                  cmd = "pkill Hyprland";
                }
                {
                  key = "n";
                  desc = "Cancel";
                  cmd = "";
                }
              ];
            }
            {
              key = "l";
              desc = "Lock";
              cmd = "hyprlock";
            }
          ];
        }
        {
          key = "r";
          desc = "Run";
          submenu = [
            {
              key = "b";
              desc = "Bluetui";
              cmd = "alacritty -e bluetui";
            }
            {
              key = "d";
              desc = "Discord";
              cmd = "discord";
            }
            {
              key = "e";
              desc = "Element Desktop";
              # Workaround for this electron bug
              # https://github.com/NixOS/nixpkgs/issues/415765
              cmd = "element-desktop --password-store=gnome-libsecret";
            }
            {
              key = "f";
              desc = "Feishin";
              cmd = "feishin";
            }
            {
              key = "k";
              desc = "KeePassXC";
              cmd = "keepassxc";
            }
            {
              key = "l";
              desc = "LibreWolf";
              cmd = "librewolf";
            }
            {
              key = "m";
              desc = "Mullvad Browser";
              cmd = "mullvad-browser";
            }
            {
              key = "n";
              desc = "Nix Search";
              cmd = "nix-search-tv print | rofi -dmenu | cut -d ' ' -f 2- | wl-copy";
            }
            {
              key = "o";
              desc = "Obsidian";
              cmd = "obsidian";
            }
            {
              key = "q";
              desc = "Qalculate";
              cmd = "qalculate-qt";
            }
            {
              key = "s";
              desc = "Steam";
              cmd = "steam";
            }
            {
              key = "t";
              desc = "Btop";
              cmd = "alacritty -e btop";
            }
            {
              key = "v";
              desc = "Pulsemixer";
              cmd = "alacritty -e pulsemixer";
            }
            {
              key = "y";
              desc = "Yazi";
              cmd = "alacritty -e yazi";
            }
          ];
        }
        {
          key = "s";
          desc = "SSH";
          submenu = [
            {
              key = "b";
              desc = "bellum.home.kappeh.org";
              cmd = "alacritty -e ssh root@bellum.home.kappeh.org";
            }
            {
              key = "e";
              desc = "linebeck.home.kappeh.org";
              cmd = "alacritty -e ssh linebeck.home.kappeh.org";
            }
            {
              key = "h";
              desc = "hipi.home.kappeh.org";
              cmd = "alacritty -e ssh hipi.home.kappeh.org";
            }
            {
              key = "l";
              desc = "leaf.home.kappeh.org";
              cmd = "alacritty -e ssh leaf.home.kappeh.org";
            }
            {
              key = "o";
              desc = "omv.home.kappeh.org";
              cmd = "alacritty -e ssh omv.home.kappeh.org";
            }
            {
              key = "p";
              desc = "pbs.home.kappeh.org";
              cmd = "alacritty -e ssh root@pbs.home.kappeh.org";
            }
          ];
        }
      ];
    };
  };
}
