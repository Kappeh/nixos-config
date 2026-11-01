{ config, lib, pkgs, ... }: let
  rofi_menu = import ../rofi_menu/default.nix { inherit pkgs lib; };

  terminal_run =
    command: "xdg-terminal-exec -e $SHELL -c \"${command}\"";

  terminal_run_and_hold =
    command: "xdg-terminal-exec -e $SHELL -c \"${command}; echo -n 'Press any key to exit...' && read -sr -k 1; exit\"";

  rofi = lib.getExe config.programs.rofi.finalPackage;

  super_menu = rofi_menu.mkMenu {
    name = "super_menu";

    menu = [
      {
        icon = "󰍉";
        text = "Search";
        type = "submenu";
        submenu = [
          {
            icon = "󱄅";
            text = "Nix";
            type = "command";
            command = terminal_run "nix-search-tv print | fzf -i --preview 'nix-search-tv preview {}' --scheme history --layout reverse | wl-copy";
          }
          {
            icon = "";
            text = "Emoji";
            type = "command";
            command = "${rofi} -modi emoji -show emoji";
          }
          {
            icon = "";
            text = "Nerd Fonts";
            type = "command";
            command = "${rofi} -modi nerdy -show nerdy";
          }
          {
            icon = "󰅌";
            text = "Clipboard";
            type = "command";
            command = "cliphist list | rofi -dmenu | cliphist decode | wl-copy";
          }
        ];
      }
      {
        icon = "";
        text = "Connectivity";
        type = "submenu";
        submenu = [
          {
            icon = "󰖩";
            text = "WiFi";
            type = "command";
            command = "notify-send 'WiFi Connectivity' 'Not Implemented Yet'";
          }
          {
            icon = "󰖂";
            text = "VPN";
            type = "command";
            command = "notify-send 'VPN Connectivity' 'Not Implemented Yet'";
          }
          {
            icon = "󰂯";
            text = "Bluetooth";
            type = "command";
            command = terminal_run "bluetui";
          }
          {
            icon = "󰣀";
            text = "SSH";
            type = "submenu";
            submenu = [
              {
                icon = "󰌢";
                text = "Ciela";
                type = "command";
                command = terminal_run "ssh ciela.home.kappeh.org";
              }
              {
                icon = "󰒋";
                text = "Leaf";
                type = "command";
                command = terminal_run "ssh leaf.home.kappeh.org";
              }
              {
                icon = "󰇅";
                text = "Neri";
                type = "command";
                command = terminal_run "ssh neri.home.kappeh.org";
              }
            ];
          }
          {
            icon = "󰋽";
            text = "Network Information";
            type = "command";
            command = "notify-send 'Network Information' 'Not Implemented Yet'";
          }
          {
            icon = "󰦬";
            text = "Network Diagnostics";
            type = "command";
            command = "notify-send 'Network Diagnostics' 'Not Implemented Yet'";
          }
        ];
      }
      {
        icon = "󱀤";
        text = "Hardware";
        type = "submenu";
        submenu = [
          {
            icon = "󰕾";
            text = "Volume Mixer";
            type = "command";
            command = terminal_run "pulsemixer";
          }
          {
            icon = "󰍹";
            text = "Display";
            type = "submenu";
            submenu = [
              {
                icon = "";
                text = "Brightness";
                type = "command";
                command = "notify-send 'Display Brightness' 'Not Implemented Yet'";
              }
              {
                icon = "󰘖";
                text = "Scaling";
                type = "command";
                command = "notify-send 'Display Scaling' 'Not Implemented Yet'";
              }
              {
                icon = "󰑧";
                text = "Orientation";
                type = "command";
                command = "notify-send 'Display Orientation' 'Not Implemented Yet'";
              }
              {
                icon = "󱐁";
                text = "Mode";
                type = "command";
                command = "notify-send 'Display Mode' 'Not Implemented Yet'";
              }
              {
                icon = "󱠩";
                text = "Night Light";
                type = "command";
                command = "notify-send 'Night Light' 'Not Implemented Yet'";
              }
              {
                icon = "󰸉";
                text = "Wallpaper";
                type = "command";
                command = "notify-send 'Display Wallpaper' 'Not Implemented Yet'";
              }
            ];
          }
          {
            icon = "󰥻";
            text = "Keyboard";
            type = "submenu";
            submenu = [
              {
                icon = "󰛨";
                text = "Backlight";
                type = "command";
                command = "notify-send 'Keyboard Backlight' 'Not Implemented Yet'";
              }
              {
                icon = "󰩓";
                text = "Keycode Tester";
                type = "command";
                command = "notify-send 'Keycode Tester' 'Not Implemented Yet'";
              }
            ];
          }
          {
            icon = "󰟸";
            text = "Touchpad";
            type = "submenu";
            submenu = [
              {
                icon = "󰕦";
                text = "Haptic Intensity";
                type = "command";
                command = "notify-send 'Touchpad Haptic Intensity' 'Not Implemented Yet'";
              }
              {
                icon = "󰳾";
                text = "Click Force";
                type = "command";
                command = "notify-send 'Touchpad Click Force' 'Not Implemented Yet'";
              }
            ];
          }
          {
            icon = "󰆽";
            text = "Touchscreen";
            type = "command";
            command = "notify-send 'Touchscreen' 'Not Implemented Yet'";
          }
          {
            icon = "󰈷";
            text = "Fingerprint LED";
            type = "command";
            command = "notify-send 'Fingerprint LED' 'Not Implemented Yet'";
          }
        ];
      }
      {
        icon = "";
        text = "Desktop";
        type = "submenu";
        submenu = [
          {
            icon = "󰨝";
            text = "Workspace Layout";
            type = "command";
            command = "notify-send 'Workspace Layout' 'Not Implemented Yet'";
          }
          {
            icon = "󰅌";
            text = "Clipboard";
            type = "submenu";
            submenu = [
              {
                icon = "󰍉";
                text = "Search";
                type = "command";
                command = "cliphist list | rofi -dmenu | cliphist decode | wl-copy";
              }
              {
                icon = "󰧧";
                text = "Delete";
                type = "command";
                command = "cliphist list | rofi -dmenu | cliphist delete";
              }
              {
                icon = "󰚤";
                text = "Clear";
                type = "command";
                command = "cliphist wipe";
              }
            ];
          }
          {
            icon = "󰹑";
            text = "Screenshot";
            type = "submenu";
            submenu = [
              {
                icon = "󰩬";
                text = "Screenshot Region";
                type = "command";
                command = "grim -g \"$(slurp)\" - | wp_copy";
              }
              {
                icon = "󰩬";
                text = "Screenshot Region and Edit";
                type = "command";
                command = "grim -g \"$(slurp)\" - | swappy -f -";
              }
              {
                icon = "󰍹";
                text = "Screenshot Monitor";
                type = "command";
                command = "notify-send 'Screenshot Monitor' 'Not Implemented Yet'";
              }
              {
                icon = "󰍹";
                text = "Screenshot Monitor and Edit";
                type = "command";
                command = "notify-send 'Screenshot Monitor and Edit' 'Not Implemented Yet'";
              }
            ];
          }
          {
            icon = "󰃣";
            text = "Theme Colours";
            type = "submenu";
            submenu = map (c: {
              icon = "󰃣";
              text = c.name;
              type = "command";
              command = "echo ${c.color} | wl-copy";
            }) [
              { name = "base00"; color = config.lib.stylix.colors.base00; }
              { name = "base01"; color = config.lib.stylix.colors.base01; }
              { name = "base02"; color = config.lib.stylix.colors.base02; }
              { name = "base03"; color = config.lib.stylix.colors.base03; }
              { name = "base04"; color = config.lib.stylix.colors.base04; }
              { name = "base05"; color = config.lib.stylix.colors.base05; }
              { name = "base06"; color = config.lib.stylix.colors.base06; }
              { name = "base07"; color = config.lib.stylix.colors.base07; }
              { name = "base08"; color = config.lib.stylix.colors.base08; }
              { name = "base09"; color = config.lib.stylix.colors.base09; }
              { name = "base0A"; color = config.lib.stylix.colors.base0A; }
              { name = "base0B"; color = config.lib.stylix.colors.base0B; }
              { name = "base0C"; color = config.lib.stylix.colors.base0C; }
              { name = "base0D"; color = config.lib.stylix.colors.base0D; }
              { name = "base0E"; color = config.lib.stylix.colors.base0E; }
              { name = "base0F"; color = config.lib.stylix.colors.base0F; }
            ];
          }
          {
            icon = "󰈊";
            text = "Colour Picker";
            type = "command";
            command = "hyprpicker --autocopy --format=hex --quiet";
          }
          {
            icon = "󰑋";
            text = "Screen Recording";
            type = "command";
            command = "notify-send 'Screen Recording' 'Not Implemented Yet'";
          }
          {
            icon = "󱔓";
            text = "Bar";
            type = "command";
            command = "notify-send 'Toggle Bar' 'Not Implemented Yet'";
          }
          {
            icon = "󰨝";
            text = "Gaps";
            type = "command";
            command = "notify-send 'Toggle Bar' 'Not Implemented Yet'";
          }
        ];
      }
      {
        icon = "󰁹";
        text = "Power and Battery";
        type = "submenu";
        submenu = [
          {
            icon = "󰓅";
            text = "Power Profile";
            type = "submenu";
            submenu = [
              {
                icon = "";
                text = "Performance";
                type = "command";
                command = "tlpctl performance";
              }
              {
                icon = "";
                text = "Balanced";
                type = "command";
                command = "tlpctl balanced";
              }
              {
                icon = "";
                text = "Power Saver";
                type = "command";
                command = "tlpctl power-saver";
              }
            ];
          }
          {
            icon = "󰋕";
            text = "Battery Charge Limit";
            type = "command";
            command = "notify-send 'Battery Charge Limit' 'Not Implemented Yet'";
          }
          {
            icon = "󰂑";
            text = "Battery Status";
            type = "command";
            command = "notify-send 'Battery Charge Limit' 'Not Implemented Yet'";
          }
        ];
      }
      {
        icon = "󰒓";
        text = "System";
        type = "submenu";
        submenu = [
          {
            icon = "󰛐";
            text = "Monitoring";
            type = "submenu";
            submenu = [
              {
                icon = "󰄪";
                text = "Resource Monitor";
                type = "command";
                command = terminal_run "btop";
              }
              {
                icon = "󰞯";
                text = "Disk Usage";
                type = "command";
                command = terminal_run "pkexec btdu /mnt/btrfs_root";
              }
            ];
          }
          {
            icon = "󰁯";
            text = "Backup and Restore";
            type = "submenu";
            submenu = [
              {
                icon = "󰵝";
                text = "Btrfs Snapshot";
                type = "command";
                command = "pkexec systemctl start btrbk-local_snapshots.service";
              }
            ];
          }
          {
            icon = "󱊟";
            text = "External Storage";
            type = "submenu";
            submenu = [
              {
                icon = "󰜄";
                text = "Mount";
                type = "command";
                command = "notify-send 'Mount External Storage' 'Not Implemented Yet'";
              }
              {
                icon = "󰛲";
                text = "Unmount";
                type = "command";
                command = "notify-send 'Unmount External Storage' 'Not Implemented Yet'";
              }
            ];
          }
          {
            icon = "󱄅";
            text = "NixOS";
            type = "submenu";
            submenu = [
              {
                icon = "󰚰";
                text = "Update";
                type = "command";
                command = "notify-send 'Update NixOS' 'Not Implemented Yet'";
              }
              {
                icon = "󰁯";
                text = "Rollback";
                type = "command";
                command = "notify-send 'Rollback NixOS' 'Not Implemented Yet'";
              }
              {
                icon = "󱩽";
                text = "Configure";
                type = "command";
                command = terminal_run "nvim ~/Projects/nixos-config";
              }
              {
                icon = "󰙨";
                text = "Test";
                type = "command";
                command = "notify-send 'Test NixOS' 'Not Implemented Yet'";
              }
              {
                icon = "󰁔";
                text = "Switch";
                type = "command";
                command = "notify-send 'Switch NixOS' 'Not Implemented Yet'";
              }
              {
                icon = "󰃢";
                text = "Garbage Collect";
                type = "command";
                command = terminal_run_and_hold "sudo nix store gc";
              }
              {
                icon = "󰮄";
                text = "Optimise";
                type = "command";
                command = terminal_run_and_hold "sudo nix store optimise";
              }
            ];
          }
          {
            icon = "󰋽";
            text = "About";
            type = "command";
            command = terminal_run_and_hold "fastfetch";
          }
        ];
      }
      {
        icon = "󰐥";
        text = "Session";
        type = "submenu";
        submenu = [
          {
            icon = "󰤁";
            text = "Shutdown";
            type = "submenu";
            submenu = [
              {
                icon = "󰄬";
                text = "Confirm";
                type = "command";
                command = "hyprshutdown -t 'Shutting Down...' --post-cmd 'shutdown -P 0'";
              }
              {
                icon = "󰜺";
                text = "Cancel";
                type = "command";
                command = "true";
              }
            ];
          }
          {
            icon = "󰑐";
            text = "Reboot";
            type = "submenu";
            submenu = [
              {
                icon = "󰄬";
                text = "Confirm";
                type = "command";
                command = "hyprshutdown -t 'Restarting...' --post-cmd 'reboot'";
              }
              {
                icon = "󰜺";
                text = "Cancel";
                type = "command";
                command = "true";
              }
            ];
          }
          {
            icon = "󰗽";
            text = "Log Out";
            type = "submenu";
            submenu = [
              {
                icon = "󰄬";
                text = "Confirm";
                type = "command";
                command = "hyprshutdown -t 'Logging Out...' --post-cmd 'pkill Hyprland'";
              }
              {
                icon = "󰜺";
                text = "Cancel";
                type = "command";
                command = "true";
              }
            ];
          }
          {
            # 󱖒
            icon = "󰏥";
            text = "Hibernate";
            type = "command";
            command = "systemctl hibernate";
          }
          {
            icon = "󰒲";
            text = "Suspend";
            type = "command";
            command = "systemctl sleep";
          }
          {
            icon = "󰍁";
            text = "Lock";
            type = "command";
            command = "hyprlock";
          }
        ];
      }
    ];
  };
in {
  config = lib.mkIf config.kappeh.desktop.enable {
    home.packages = [ super_menu ];
  };
}

