{ config, lib, pkgs, ... }: {
  options.myModules.users.normal.kieran.enable = lib.mkEnableOption "Enable kieran user and group";

  config = lib.mkIf config.myModules.users.normal.kieran.enable {
    users.users.kieran = {
      uid = 1000;

      name = "kieran";
      group = "kieran";
      extraGroups = builtins.concatLists [
        [
          "users"
          "video"           # Enable video devices for user
          "wheel"           # Enable `sudo` for user
        ]
        # Allow gamemode user daemon to change CPU governor or niceness
        (lib.optional config.myModules.applications.gaming.gamemode.enable "gamemode")
        # Grant password-less access to the RW daemon socket
        (lib.optional config.myModules.virtualisation.qemu.enable "libvirtd")
        # Allow non-root user to capture network packets without needing superuser privileges
        (lib.optional config.myModules.applications.misc.wireshark.enable "wireshark")
      ];

      hashedPasswordFile = config.sops.secrets."users/kieran/hashedPassword".path;
      openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOCUJsStgjTCObc7BrzoGDE3tj633SbghefFM2wk20gX local" ];

      isNormalUser = true;
      isSystemUser = false;

      shell = pkgs.zsh;
      useDefaultShell = true;
    };

    users.groups.kieran = {
      gid = 1000;

      name = "kieran";
      members = [ "kieran" ];
    };

    home-manager.users.kieran = { config, osConfig, ...}: {
      imports = [
        ../home/default.nix
      ];

      config = {
        home = {
          username = "kieran";
          homeDirectory = "/home/${config.home.username}";
          persistence."/backup".directories = [
            "Apps"
            "Desktop"
            "Documents"
            "Downloads"
            "Music"
            "Pictures"
            "Storage"
            "Videos"
            "dev"
            "scripts"
          ];

          stateVersion = "24.05";
        };

        # Map home manager options to nixos options
        # This keeps host specific configuration out of home manager modules
        myModules = with osConfig.myModules; {
          applications = with applications; {
            browsers = with browsers; {
              librewolf.enable = librewolf.enable;
              mullvad_browser.enable = mullvad_browser.enable;
              tor_browser.enable = tor_browser.enable;
            };
            editors = with editors; {
              godot.enable = godot.enable;
              obsidian.enable = obsidian.enable;
              vscodium.enable = vscodium.enable;
            };
            file_managers = with file_managers; {
              pcmanfm.enable = pcmanfm.enable;
            };
            gaming = with gaming; {
              prismlauncher.enable = prismlauncher.enable;
              protonup_qt.enable = protonup_qt.enable;
              r2modman.enable = r2modman.enable;
              sidequest.enable = sidequest.enable;
              steam.enable = steam.enable;
              supertuxkart.enable = supertuxkart.enable;
              tetrio.enable = tetrio.enable;
            };
            media = with media; {
              cava.enable = cava.enable;
              davinci_resolve.enable = davinci_resolve.enable;
              easyeffects.enable = easyeffects.enable;
              feh.enable = feh.enable;
              feishin.enable = feishin.enable;
              gimp.enable = gimp.enable;
              krita.enable = krita.enable;
              libreoffice.enable = libreoffice.enable;
              mpd_mpris.enable = mpd_mpris.enable;
              obs_studio.enable = obs_studio.enable;
              picard.enable = picard.enable;
              rmpc.enable = rmpc.enable;
              vlc.enable = vlc.enable;
            };
            messaging = with messaging; {
              nixcord.enable = nixcord.enable;
              webcord.enable = webcord.enable;
              discord.enable = discord.enable;
              element_desktop.enable = element_desktop.enable;
            };
            misc = with misc; {
              gqrx.enable = gqrx.enable;
              qalculate.enable = qalculate.enable;
              qmk.enable = qmk.enable;
              qpwgraph.enable = qpwgraph.enable;
              rtl_sdr.enable = rtl_sdr.enable;
              via.enable = via.enable;
              wireshark.enable = wireshark.enable;
              xarchiver.enable = xarchiver.enable;
            };
            modelling = with modelling; {
              blender.enable = blender.enable;
              freecad.enable = freecad.enable;
            };
            security = with security; {
              keepass_diff.enable = keepass_diff.enable;
              keepassxc.enable = keepassxc.enable;
            };
            terminals = with terminals; {
              alacritty.enable = alacritty.enable;
              kitty.enable = kitty.enable;
            };
          };
          core = with core; {
            appimage.enable = appimage.enable;
            fontcache.enable = fontcache.enable;
            gnupg.enable = gnupg.enable;
            hunspell.enable = hunspell.enable;
            numlock.enable = numlock.enable;
            nvidia.enable = nvidia.enable;
            pipewire.enable = pipewire.enable;
            sops.enable = sops.enable;
            ssh.enable = ssh.enable;
            syncthing.enable = syncthing.enable;
          };
          desktop = with desktop; {
            awww.enable = awww.enable;
            cliphist.enable = cliphist.enable;
            cursor_theme.enable = cursor_theme.enable;
            dconf.enable = dconf.enable;
            hyprland.enable = hyprland.enable;
            libnotify.enable = libnotify.enable;
            mako.enable = mako.enable;
            rofi.enable = rofi.enable;
            udiskie.enable = udiskie.enable;
            waybar.enable = waybar.enable;
            wlr_which_key.enable = wlr_which_key.enable;
            xdg_mime.enable = xdg_mime.enable;
          };
          shells = with shells; {
            rust.enable = rust.enable;
            zsh.enable = zsh.enable;
          };
          tools = with tools; {
            bat.enable = bat.enable;
            bluetui.enable = bluetui.enable;
            btdu.enable = btdu.enable;
            btop.enable = btop.enable;
            delta.enable = delta.enable;
            eza.enable = eza.enable;
            f3.enable = f3.enable;
            fastfetch.enable = fastfetch.enable;
            fd.enable = fd.enable;
            fzf_git_sh.enable = fzf_git_sh.enable;
            fzf.enable = fzf.enable;
            gh.enable = gh.enable;
            git.enable = git.enable;
            lazygit.enable = lazygit.enable;
            lf.enable = lf.enable;
            lsp = with lsp; {
              bashls.enable = bashls.enable;
              docker_compose_ls.enable = docker_compose_ls.enable;
              docker_ls.enable = docker_ls.enable;
              nixd.enable = nixd.enable;
              rust_analyzer.enable = rust_analyzer.enable;
            };
            nix_index.enable = nix_index.enable;
            nix_search_tv.enable = nix_search_tv.enable;
            nixvim.enable = nixvim.enable;
            playerctl.enable = playerctl.enable;
            pulsemixer.enable = pulsemixer.enable;
            ripgrep.enable = ripgrep.enable;
            tldr.enable = tldr.enable;
            tmux.enable = tmux.enable;
            tree.enable = tree.enable;
            unzip.enable = unzip.enable;
            wget.enable = wget.enable;
            xclip.enable = xclip.enable;
            yazi.enable = yazi.enable;
            zip.enable = zip.enable;
            zoxide.enable = zoxide.enable;
          };
        };
      };
    };
  };
}
