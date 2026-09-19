{ config, pkgs, ... }: {
  config = {
    users.users.kieran = {
      uid = 1000;

      name = "kieran";
      group = "kieran";
      extraGroups = [
        "users"
        "video" # Enable video devices for user
        "wheel" # Enable `sudo` for user
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
      imports = [ ../../home/default.nix ];

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

        kappeh = with osConfig.kappeh; {
          applications = with applications; {
            browsers = with browsers; {
              librewolf.enable = librewolf.enable;
              mullvad_browser.enable = mullvad_browser.enable;
              tor_browser.enable = tor_browser.enable;
            };
            file_managers = with file_managers; {
              lf.enable = lf.enable;
              pcmanfm.enable = pcmanfm.enable;
              yazi.enable = yazi.enable;
            };
            appimage.enable = appimage.enable;
            gqrx.enable = gqrx.enable;
            libreoffice.enable = libreoffice.enable;
            obsidian.enable = obsidian.enable;
            qalculate.enable = qalculate.enable;
            rtl_sdr.enable = rtl_sdr.enable;
            xarchiver.enable = xarchiver.enable;
          };
          audio.enable = audio.enable;
          communication = with communication; {
            discord.enable = discord.enable;
            element_desktop.enable = element_desktop.enable;
            nixcord.enable = nixcord.enable;
            protonmail_desktop.enable = protonmail_desktop.enable;
            webcord.enable = webcord.enable;
          };
          desktop.enable = desktop.enable;
          development = with development; {
            lsp = with lsp; {
              bashls.enable = bashls.enable;
              docker_compose_ls.enable = docker_compose_ls.enable;
              docker_ls.enable = docker_ls.enable;
              nixd.enable = nixd.enable;
              rust_analyzer.enable = rust_analyzer.enable;
            };
            nixvim.enable = nixvim.enable;
            blender.enable = blender.enable;
            delta.enable = delta.enable;
            freecad.enable = freecad.enable;
            gh.enable = gh.enable;
            git.enable = git.enable;
            godot.enable = godot.enable;
            lazygit.enable = lazygit.enable;
            nix_index.enable = nix_index.enable;
            nix_search_tv.enable = nix_search_tv.enable;
            qmk.enable = qmk.enable;
            via.enable = via.enable;
          };
          gaming = with gaming; {
            prismlauncher.enable = prismlauncher.enable;
            protontricks.enable = protontricks.enable;
            protonup_qt.enable = protonup_qt.enable;
            r2modman.enable = r2modman.enable;
            sidequest.enable = sidequest.enable;
            steam.enable = steam.enable;
            supertuxkart.enable = supertuxkart.enable;
            tetrio.enable = tetrio.enable;
          };
          hardware = with hardware; {
            nvidia.enable = nvidia.enable;
          };
          media = with media; {
            cava.enable = cava.enable;
            davinci_resolve.enable = davinci_resolve.enable;
            easyeffects.enable = easyeffects.enable;
            feh.enable = feh.enable;
            feishin.enable = feishin.enable;
            gimp.enable = gimp.enable;
            krita.enable = krita.enable;
            obs_studio.enable = obs_studio.enable;
            picard.enable = picard.enable;
            vlc.enable = vlc.enable;
          };
          networking = with networking; {
            bluetui.enable = bluetui.enable;
            wireshark.enable = wireshark.enable;
          };
          security = with security; {
            gnupg.enable = gnupg.enable;
            keepass_diff.enable = keepass_diff.enable;
            keepassxc.enable = keepassxc.enable;
            ssh.enable = ssh.enable;
          };
          services = with services; {
            ollama.enable = ollama.enable;
            syncthing.enable = syncthing.enable;
          };
          shell = with shell; {
            terminals = with terminals; {
              alacritty.enable = alacritty.enable;
              kitty.enable = kitty.enable;
            };
            bat.enable = bat.enable;
            btop.enable = btop.enable;
            eza.enable = eza.enable;
            fastfetch.enable = fastfetch.enable;
            fd.enable = fd.enable;
            fzf.enable = fzf.enable;
            fzf_git_sh.enable = fzf_git_sh.enable;
            ripgrep.enable = ripgrep.enable;
            tldr.enable = tldr.enable;
            tmux.enable = tmux.enable;
            tree.enable = tree.enable;
            unzip.enable = unzip.enable;
            wget.enable = wget.enable;
            zip.enable = zip.enable;
            zoxide.enable = zoxide.enable;
          };
          storage = with storage; {
            btdu.enable = btdu.enable;
            f3.enable = f3.enable;
            udiskie.enable = udiskie.enable;
          };
        };
      };
    };
  };
}
