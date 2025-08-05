{ config, osConfig, lib, pkgs, inputs, ...}: {
  imports = [
    ./alacritty.nix
    ./appimage.nix
    ./bash/default.nix
    ./bat.nix
    ./blender.nix
    ./bluetui.nix
    ./btdu.nix
    ./btop.nix
    ./cliphist.nix
    ./conda.nix
    ./cursor_theme.nix
    ./da_vinci_resolve.nix
    ./dconf.nix
    ./discord.nix
    ./easyeffects.nix
    ./element_desktop.nix
    ./eza.nix
    ./f3.nix
    ./fastfetch.nix
    ./fd.nix
    ./feh.nix
    ./feishin.nix
    ./firefox.nix
    ./fonts.nix
    ./freecad.nix
    ./fzf_git_sh.nix
    ./fzf.nix
    ./gh.nix
    ./gimp.nix
    ./git.nix
    ./gnupg.nix
    ./godot.nix
    ./gparted.nix
    ./gqrx.nix
    ./hunspell.nix
    ./hyprland/default.nix
    ./hyprlock.nix
    ./hyprpaper/default.nix
    ./hyprpicker.nix
    ./hyprpolkitagent.nix
    ./hyprshot.nix
    # ./idea.nix
    ./java.nix
    ./jellyfin_media_player.nix
    ./keepass_diff.nix
    ./keepassxc.nix
    ./lf.nix
    ./libreoffice.nix
    ./librewolf.nix
    ./mako.nix
    ./nixvim.nix
    ./obs_studio.nix
    ./obsidian.nix
    ./pulsemixer.nix
    ./pcmanfm.nix
    ./pipewire.nix
    ./playerctl.nix
    ./prismlauncher.nix
    ./protonup.nix
    ./qmk.nix
    ./qpwgraph.nix
    ./qt.nix
    ./r2modman.nix
    ./rtl_sdr.nix
    ./rust.nix
    ./sidequest.nix
    ./sops.nix
    ./ssh.nix
    ./steam.nix
    ./syncthing.nix
    ./thefuck.nix
    ./tmux.nix
    ./tree.nix
    ./udiskie.nix
    ./vlc.nix
    ./vscodium.nix
    ./waybar/default.nix
    ./webcord/default.nix
    ./wireshark.nix
    ./wofi/default.nix
    ./wofi_power_menu/default.nix
    ./xarchiver.nix
    ./xclip.nix
    ./yazi.nix
    ./zoxide.nix
    ./zsh.nix
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  config = {
    home = {
      homeDirectory = "/home/kieran";
      username = "kieran";
      stateVersion = "24.05";
    };

    xsession.numlock.enable = true;
    systemd.user.services.numlockx.Install.WantedBy = lib.mkForce [];

    xdg = {
      enable = true;

      mime.enable = true;
      mimeApps = {
        enable = true;
        defaultApplications = {
          "inode/directory" = [ "pcmanfm.desktop" ];
          "text/html" = "librewolf.desktop";
          "x-scheme-handler/http" = "librewolf.desktop";
          "x-scheme-handler/https" = "librewolf.desktop";
          "x-scheme-handler/about" = "librewolf.desktop";
          "x-scheme-handler/unknown" = "librewolf.desktop";
        };
      };
    };

    home.persistence = {
      "/persist/home/kieran".allowOther = true;
      "/backup/home/kieran" = {
        allowOther = true;
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
      };
      "/storage/home/kieran" = {
        allowOther = true;
        directories = [ "Storage" ];
      };
    };
  };
}
