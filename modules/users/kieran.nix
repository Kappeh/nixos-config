{ config, lib, pkgs, ... }: {
  options.myModules.users.normal.kieran.enable = lib.mkEnableOption "Enable kieran user and group";

  config = lib.mkIf config.myModules.users.normal.kieran.enable {
    users = {
      users.kieran = {
        name = "kieran";
        uid = 1000;
        group = "kieran";
        isNormalUser = true;
        hashedPasswordFile = config.sops.secrets."users/kieran/hashedPassword".path;
        openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOCUJsStgjTCObc7BrzoGDE3tj633SbghefFM2wk20gX local" ];
        shell = pkgs.zsh;
        useDefaultShell = true;
        extraGroups = builtins.concatLists [
          [
            "users"

            "audio"           # Enable audio devices for user
            "video"           # Enable video devices for user
            "wheel"           # Enable `sudo` for user
          ]
          # Grant access to duplicati files
          (lib.optional config.myModules.users.system.duplicati.enable "duplicati")
          # Grant access to FreshRSS files
          (lib.optional config.myModules.users.system.freshrss.enable "freshrss")
          # Allow gamemode user daemon to change CPU governor or niceness
          (lib.optional config.myModules.applications.gaming.gamemode.enable "gamemode")
          # Grant access to illegal crime minecraft server files
          (lib.optional config.myModules.users.system.illegal_crime_mc.enable "illegal_crime_mc")
          # Grant password-less access to the RW daemon socket
          (lib.optional config.myModules.virtualisation.qemu.enable "libvirtd")
          # Enable network manager for user
          (lib.optional config.myModules.core.networkmanager.enable "networkmanager")
          # Grant access to shared files used by services
          (lib.optional config.myModules.users.system.services.enable "services")
          # Grant access to synapse files
          (lib.optional config.myModules.users.system.synapse.enable "synapse")
          # Grant access to syncthing files
          (lib.optional config.myModules.users.system.syncthing.enable "syncthing")
        ];
      };
      groups.kieran = {
        name = "kieran";
        gid = 1000;
        members = [ "kieran" ];
      };
    };

    home-manager.users.kieran = { config, osConfig, lib, inputs, ...}: {
      imports = [
        ../home/default.nix
        inputs.impermanence.nixosModules.home-manager.impermanence
      ];
      config = {
        myModules = {
          applications = {
            enable = osConfig.myModules.applications.enable;
            editors.idea.enable = false;

            # Known issues
            # qt5 qtwebengine is unmaintained upstream since april 2025.
            media.jellyfin_media_player.enable = false;

            # Build can fail due to race condition in libsecret test
            # https://gitlab.gnome.org/GNOME/libsecret/-/issues/80
            # media.davinci_resolve.enable = false;
          };
          core.enable = true;
          desktop.enable = osConfig.myModules.desktop.enable;
          shells.enable = true;
          tools.enable = true;
        };

        home = {
          username = "kieran";
          homeDirectory = "/home/${config.home.username}";
          stateVersion = "24.05";
        };

        home.persistence = {
          "/persist/home/${config.home.username}".allowOther = true;
          "/backup/home/${config.home.username}" = {
            allowOther = true;
            directories = [
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
          };
        };
      };
    };
  };
}
