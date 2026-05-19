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

            "wireshark"
          ]
          # Allow gamemode user daemon to change CPU governor or niceness
          (lib.optional config.myModules.applications.gaming.gamemode.enable "gamemode")
          # Grant password-less access to the RW daemon socket
          (lib.optional config.myModules.virtualisation.qemu.enable "libvirtd")
          # Enable network manager for user
          (lib.optional config.myModules.core.networkmanager.enable "networkmanager")
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
      ];
      config = {
        myModules = {
          applications = {
            enable = osConfig.myModules.applications.enable;

            # Failed to build
            emulation.fceux.enable = false;

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

        home.persistence."/backup".directories = [
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
}
