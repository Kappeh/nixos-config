# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ../../modules/system/impermanence.nix
    ../../modules/system/lightdm.nix
    ../../modules/system/logiops/default.nix
    ../../modules/system/nvidia.nix
    ../../modules/system/pipewire.nix
    ../../modules/system/sops.nix
    ../../modules/system/ssl/default.nix
    ../../modules/system/wireguard.nix
    ../../scripts/default.nix
    ./backups.nix
    ./hardware-configuration.nix
    ./programs.nix
    inputs.sops-nix.nixosModules.sops
  ];

  # Simply for moungting NTFS filesystems such as external drives
  boot.supportedFilesystems = [ "ntfs" ];

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  fileSystems = {
    "/backup".neededForBoot = true;
    "/persist".neededForBoot = true;
    "/var/log".neededForBoot = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot = {
    enable = true;
    editor = false;           # Recommended to set to false, as it allows gaining root access
    configurationLimit = 100; # To prevent boot partition running out of disk space
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "neri"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
  };

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    options = "eurosign:4,caps:escape";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;
    mouse.horizontalScrolling = true;
    mouse.middleEmulation = false;
  };

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };

  # Remove security lecture for sudo
  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';

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
    packages = with pkgs; [
      btdu
      conda
      discord
      element-desktop
      fastfetch
      fzf-git-sh
      gimp
      gparted
      gqrx
      hunspell
      hunspellDicts.en_GB-ise
      jetbrains.idea-community
      kdePackages.qt6ct
      keepass-diff
      keepassxc
      libreoffice-qt
      libsForQt5.qt5ct
      ncpamixer
      obsidian
      playerctl
      prismlauncher
      protonup-qt
      qmk
      qpwgraph
      rtl-sdr
      scrot
      sidequest
      steam
      tree
      vlc
      wireshark
      xclip
    ];
  };

  # Home manager
  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      kieran = import ../../home/kieran/default.nix;
    };
  };

  # Environment variables
  environment.sessionVariables = {
    EDITOR = "vim";
    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    GTK2_RC_FILES="${pkgs.gnome-themes-extra}/share/themes/Adwaita-dark/gtk-2.0/gtkrc";
    MOX_USE_XINPUT2 = "1"; # Smooth scrolling in Firefox
  };

  # Fonts
  fonts.packages = with pkgs; [
    cascadia-code
    dina-font
    fira-code
    fira-code-symbols
    liberation_ttf
    mplus-outline-fonts.githubRelease
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    proggyfonts
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

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

}
