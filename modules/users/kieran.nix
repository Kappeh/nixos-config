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
          "audio"           # Enable audio devices for user
          "video"           # Enable video devices for user
          "wheel"           # Enable `sudo` for user
          "wireshark"
        ]
        # Allow gamemode user daemon to change CPU governor or niceness
        (lib.optional config.myModules.applications.gaming.gamemode.enable "gamemode")
        # Grant password-less access to the RW daemon socket
        (lib.optional config.myModules.virtualisation.qemu.enable "libvirtd")
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
          stateVersion = "24.05";
        };

        myModules = {
          applications.enable = osConfig.myModules.applications.enable;
          core.enable = true;
          desktop.enable = osConfig.myModules.desktop.enable;
          shells.enable = true;
          tools.enable = true;
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
