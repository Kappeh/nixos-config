{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ../modules/system/impermanence/default.nix
    ../modules/system/networking/ssl/default.nix
    ../modules/system/sops.nix
    inputs.sops-nix.nixosModules.sops
  ];

  config = {
    nixpkgs.config.allowUnfree = true;
    nix.settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };

    # Use the systemd-boot EFI boot loader.
    boot.loader = {
      systemd-boot = {
        enable = true;
        editor = false;           # Recommended to set to false, as it allows gaining root access
        configurationLimit = 100; # To prevent boot partition running out of disk space
      };
      efi.canTouchEfiVariables = true;
    };

    # Select internationalisation properties.
    i18n.defaultLocale = "en_GB.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      useXkbConfig = true; # use xkb.options in tty.
    };

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "gb";
      options = "eurosign:4,caps:escape";
    };
  };
}
