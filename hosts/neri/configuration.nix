# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ../../modules/system/hardware/bluetooth.nix
    ../../modules/system/hardware/libinput.nix
    ../../modules/system/hardware/logiops/default.nix
    ../../modules/system/hardware/nvidia.nix
    ../../modules/system/hardware/qmk.nix
    ../../modules/system/hardware/rtl_sdr.nix
    ../../modules/system/hardware/udisks.nix
    ../../modules/system/hyprland.nix
    ../../modules/system/impermanence/default.nix
    ../../modules/system/networking/networkmanager.nix
    ../../modules/system/networking/wireguard.nix
    ../../modules/system/programs/alvr.nix
    ../../modules/system/programs/appimage.nix
    # ../../modules/system/programs/clipcat.nix
    ../../modules/system/programs/dconf.nix
    ../../modules/system/programs/droidcam.nix
    ../../modules/system/programs/gamemode.nix
    ../../modules/system/programs/greetd.nix
    # ../../modules/system/programs/lightdm.nix
    ../../modules/system/programs/noisetorch.nix
    ../../modules/system/programs/obs_studio.nix
    ../../modules/system/programs/pipewire.nix
    ../../modules/system/programs/via.nix
    ../../modules/system/programs/wireshark.nix
    ../../modules/system/programs/zsh.nix
    ../../scripts/default.nix
    ../common.nix
    ./backups.nix
    ./hardware-configuration.nix
    ./ssh.nix
  ];

  config = {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;

      # Simply for mounting NTFS filesystems such as external drives
      supportedFilesystems = [ "ntfs" ];
    };

    networking.hostName = "neri"; # Define your hostname.

    # Set your time zone.
    time.timeZone = "Europe/London";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.kieran = {
      uid = 1000;
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."users/kieran/hashedPassword".path;
      shell = pkgs.zsh;
      useDefaultShell = true;
      extraGroups = [
        "audio"           # Enable audio devices for user
        "gamemode"        # Allow gamemode user daemon to change CPU governor or niceness
        "networkmanager"  # Enable network manager for user
        "video"           # Enable video devices for user
        "wheel"           # Enable `sudo` for user
      ];
    };

    # Home manager
    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      useGlobalPkgs = true;
      useUserPackages = true;
      users.kieran = import ../../home/kieran/default.nix;
    };

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      adwaita-qt
      adwaita-qt6
      # beekeeper-studio
      cemu
      desmume
      dolphin-emu
      fceux
      gnome-themes-extra
      libnotify
      libretro.citra
      mgba
      # mupen64plus
      snes9x
      tldr
      unzip
      via
      vim
      wget
      zip
    ];

    xdg.terminal-exec.enable = true;
    # environment.variables.XDG_TERMINAL = "${pkgs.alacritty}/bin/alacritty";

    # Environment variables
    environment.sessionVariables = {
      EDITOR = "vim";
      GTK_THEME = "Adwaita:dark";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      GTK2_RC_FILES="${pkgs.gnome-themes-extra}/share/themes/Adwaita-dark/gtk-2.0/gtkrc";
      MOX_USE_XINPUT2 = "1"; # Smooth scrolling in Firefox
      XDG_TERMINAL = "${pkgs.alacritty}/bin/alacritty";
    };

    # Fonts
    fonts.packages = with pkgs; [
      cascadia-code
      dina-font
      fira-code
      fira-code-symbols
      liberation_ttf
      mplus-outline-fonts.githubRelease
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      proggyfonts
      font-awesome
      jetbrains-mono
      lexend
    ];

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # Copy the NixOS configuration file and link it from the resulting system
    # (/run/current-system/configuration.nix). This is useful in case you
    # accidentally delete configuration.nix.
    # system.copySystemConfiguration = true;

    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    #
    # Most users should NEVER change this value after the initial install, for any reason,
    # even if you've upgraded your system to a new NixOS release.
    #
    # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
    # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
    # to actually do that.
    #
    # This value being lower than the current NixOS release does NOT mean your system is
    # out of date, out of support, or vulnerable.
    #
    # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
    # and migrated your data accordingly.
    #
    # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system.stateVersion = "24.05"; # Did you read the comment?
  };
}
