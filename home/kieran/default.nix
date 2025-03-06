{ config, osConfig, lib, pkgs, inputs, ...}: {
  imports = [
    ./alacritty.nix
    ./bash/default.nix
    ./bat.nix
    ./blender.nix
    ./bluetui.nix
    ./bspwm/default.nix
    ./btdu.nix
    ./btop.nix
    # ./clipcat/default.nix
    ./cliphist.nix
    ./conda.nix
    ./cursor_theme.nix
    ./da_vinci_resolve.nix
    ./discord.nix
    ./dunst/default.nix
    ./easyeffects.nix
    ./element_desktop.nix
    ./eza.nix
    ./fastfetch.nix
    ./fd.nix
    ./feh.nix
    ./firefox.nix
    ./flameshot.nix
    ./freecad.nix
    ./fzf_git_sh.nix
    ./fzf.nix
    ./gh.nix
    ./gimp.nix
    ./git.nix
    ./gparted.nix
    ./gqrx.nix
    ./hunspell.nix
    ./hyprland/default.nix
    ./hyprpaper/default.nix
    ./hyprpicker.nix
    ./hyprshot.nix
    # ./idea.nix
    ./jellyfin_media_player.nix
    ./keepass_diff.nix
    ./keepassxc.nix
    ./lf.nix
    ./libreoffice.nix
    ./ncpamixer.nix
    ./nixvim.nix
    ./obsidian.nix
    ./pulsemixer.nix
    ./pcmanfm.nix
    ./picom.nix
    ./playerctl.nix
    ./polybar.nix
    ./prismlauncher.nix
    ./protonup.nix
    ./qmk.nix
    ./qpwgraph.nix
    ./qt.nix
    ./rofi.nix
    ./rtl_sdr.nix
    ./scrot.nix
    ./sidequest.nix
    ./steam.nix
    ./syncthing.nix
    ./thefuck.nix
    ./tmux.nix
    ./tree.nix
    ./udiskie.nix
    ./vlc.nix
    ./vscodium.nix
    ./waybar/default.nix
    ./wireshark.nix
    ./wofi/default.nix
    ./xarchiver.nix
    ./xclip.nix
    ./yazi.nix
    ./zoxide.nix
    ./zsh.nix
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  config.systemd.user.services.numlockx.Install.WantedBy = lib.mkForce [];

  config = {
    home = {
      homeDirectory = "/home/kieran";
      username = "kieran";
      stateVersion = "24.05";
    };

    xsession.numlock.enable = true;

    xdg = {
      enable = true;

      mime.enable = true;
      mimeApps = {
        enable = true;
        defaultApplications = {
          "inode/directory" = [ "pcmanfm.desktop" ];
        };
      };
    };

    home.persistence = {
      "/persist/home/kieran" = {
        directories = [
          ".gnupg"
          ".ssh"
          ".nixops"
          ".config/pulse"
          ".local/state/wireplumber"

          ".mozilla/firefox/default/" # Firefox - to keep addons enabled and remember addon settings
          ".mozilla/native-messaging-hosts" # KeePassXC-Browser for firefox
          ".config/discord" # Discord - to stop it opening browser each boot and remember settings
          ".config/gh" # Github Cli
          ".cache/keepassxc/" # Remember recent databases
          ".config/keepassxc/" # Remember settings e.g. password generator
          ".rustup" # Rustup - to prevent having to reinstalling toolchain
          ".cargo" # Cargo - to persist packages installed with cargo
          "Sync" # Syncthing - shared directories
          ".local/state/syncthing" # Syncthing - state and config
          ".config/pulse" # Pulseaudio
          ".local/state/wireplumber" # Wireplumber
          ".config/gqrx" # Gqrx
          ".config/qt5ct" # qt5ct
          ".config/qt6ct" # qt6ct
          "qmk_firmware" # Qmk - firmware
          ".config/qmk/" # Qmk - config
          ".conda" # Conda
          ".config/Element" # Element
          ".cache/appimage-run" # AppImage - install cache
          ".cache/clipcat" # Clipcat - Clipboard history
          ".config/obsidian" # Obsidian - Config and session information
          ".config/beekeeper-studio" # Beekeeper Studio - Database Connections and config
          ".local/share/zsh" # Zsh - zsh_history
          ".local/share/zoxide" # Zoxide - zoxide database
          ".cache/fontconfig" # Cache fontconfig because it is big and causes some apps to take a while to start
          ".config/libfm" # libfm - pcmanfm config
          ".config/pcmanfm/default" # pcmanfm - config
          ".cache/blender" # blender - cache
          ".config/blender" # blender - config
          ".cache/DaVinci_Resolve_Welcome" # Da Vinci Resolve - To prevent welcome message each boot
          ".local/share/DaVinciResolve" # Da Vinci Resolve - Data
          ".local/share/Jellyfin Media Player"
          ".config/jellyfin.org"
          ".local/share/jellyfinmediaplayer"
          ".config/JetBrains" # JetBrains - Persist IntelliJ IDEA CE state
          ".local/share/JetBrains" # JetBrains - Persist IntelliJ IDEA CE state
          ".java" # Java
          ".config/easyeffects" # EastEffects - Persist Presents
          ".config/dconf"
        ];
        files = [
          ".bash_history"
          ".config/noisetorch/config.toml"
          ".config/rncbc.org/qpwgraph.conf"
          ".config/sops/age/keys.txt"
          ".ncpamixer.conf"
          "default.qpwgraph"
          ".cache/rofi3.druncache"
        ];
        allowOther = true;
      };

      "/backup/home/kieran" = {
        directories = [
          "Apps"
          "Desktop"
          "Downloads"
          "Music"
          "Pictures"
          "Documents"
          "Videos"

          "dev"
        ];
        files = [];
        allowOther = true;
      };

      "/storage/home/kieran" = {
        directories = [
          { directory = "Storage"; } # Directory for large files
          { directory = ".local/share/PrismLauncher"; } # Prism launcher config
          { directory = ".local/share/Factorio"; method = "symlink"; }
          { directory = ".factorio"; }
          { directory = ".local/share/FasterThanLight"; method = "symlink"; }
          { directory = ".local/share/IntoTheBreach"; method = "symlink"; }
          { directory = ".local/share/Terraria"; }
          { directory = ".local/share/Steam"; method = "symlink"; }
          { directory = ".local/share/Daedalic Entertainment GmbH"; method = "symlink"; }
        ];
        files = [];
        allowOther = true;
      };
    };
  };
}
