{ config, inputs, pkgs, ... }: {
  config = {
    users.users.kieran = {
      uid = 1000;
      name = "kieran";
      group = "kieran";
      extraGroups = [ "wheel" ];
      hashedPasswordFile = config.sops.secrets."users/kieran/hashedPassword".path;
      openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOCUJsStgjTCObc7BrzoGDE3tj633SbghefFM2wk20gX local" ];
      isNormalUser = true;
      isSystemUser = false;
      shell = pkgs.zsh;
      useDefaultShell = true;
    };

    users.groups.kieran = {
      gid = 1000;
      members = [ "kieran" ];
    };

    home-manager.users.kieran = { ... }: {
      imports = [
        ../../modules/home/default.nix
        inputs.impermanence.nixosModules.home-manager.impermanence
      ];

      config = {
        myModules = {
          core = {
            sops.enable = true;
            ssh.enable = true;
          };
          shells = {
            enable = true;
            rust.enable = false;
          };
          tools = {
            enable = true;
            bluetui.enable = false;
            f3.enable = false;
            playerctl.enable = false;
            pulsemixer.enable = false;
          };
        };

        home = {
          username = "kieran";
          homeDirectory = "/home/kieran";
          stateVersion = "24.05";
        };

        home.persistence = {
          "/backup/home/kieran".allowOther = true;
          "/persist/home/kieran".allowOther = true;
        };
      };
    };
  };
}
