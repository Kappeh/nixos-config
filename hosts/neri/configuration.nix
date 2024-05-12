{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    inputs.sops-nix.nixosModules.sops
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  # Use the Grub EFI boot loader with OSProber.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      devices = [ "nodev" ];
      efiSupport = true;
      enable = true;
      useOSProber = true;
    };
  };

  # Enable support for NTFS to access Windows filesystems
  boot.supportedFilesystems = [ "ntfs" ];

  # Set RTC time standard to localtime, compatible with Windows
  time.hardwareClockInLocalTime = true;

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

  services = {
    displayManager.defaultSession = "none+bspwm";

    xserver = {
      enable = true;

      # Use lightdm as display manager
      displayManager = {
        lightdm = {
          enable = true;
          greeters.slick.enable = true;
          background = ../../login_wallpaper.png;
        };

	# Set screen resolution, framerate and position (position of DP-2 on seperate line because it doesn't seem to work otherwise)
        setupCommands = ''
          ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-0 --primary --pos 1366x0 --mode 1920x1080 --rate 60.00
          ${pkgs.xorg.xrandr}/bin/xrandr --output DP-2 --left-of HDMI-0 --mode 1366x768 --rate 60.00
          ${pkgs.xorg.xrandr}/bin/xrandr --output DP-2 --pos 0x312
        '';

        # Enable auto-login
        #autoLogin.enable = true;
        #autoLogin.user = "kieran";
      };

      # Use Bspwm as window manager
      windowManager.bspwm = {
        enable = true;

        configFile = ../../modules/nixos/bspwm/bspwmrc;
        sxhkd.configFile = ../../modules/nixos/bspwm/sxhkdrc;
      };

       # Better support for general peripherals
      libinput.enable = true;

      # Configure keymap in X11
      xkb = {
        layout = "gb";
        options = "eurosign:4,caps:escape";
      };
    };
  };

  # X11 windowing system + GNOME Desktop Environment.
  #services.xserver.enable = true;
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.excludePackages = [ pkgs.xterm ];
  #environment.gnome.excludePackages = [ pkgs.gnome-tour ];
  # Disable Wayland due to incompatabilities with Nvidia drivers
  #services.xserver.displayManager.gdm.wayland = false;
  # Auto-login
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "kieran";
  # GNOME auto-login workaround (https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229)
  #systemd.services."getty@tty1".enable = false;
  #systemd.services."autovt@tty1".enable = false;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "gb";
  # services.xserver.xkb.options = "eurosign:4,caps:escape";

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    #support32Bit = true;
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
  services.blueman.enable = true;

  hardware.pulseaudio.extraConfig = ''
    load-module module-bluetooth-policy
    load-module module-bluetooth-discover
    ## module fails to load with
    ##   module-bluez5-device.c: Failed to get device path from module arguments
    ##   module.c: Failed to load module "module-bluez5-device" (argument: ""): initialization failed.
    # load-module module-bluez5-device
    # load-module module-bluez5-discover
  '';

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    rxvt-unicode
    vim
    wget
    ncpamixer
  ];

  # Session variables
  environment.sessionVariables = {
    EDITOR = "vim";
  };

  # Remove security lecture for sudo
  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';

  # Fonts
  fonts.packages = with pkgs; [
    cascadia-code
  ];

  # Wipe root partition on boot
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount /dev/mapper/root /btrfs_tmp
    if [[ -e /btrfs_tmp/root ]]; then
      mkdir -p /btrfs_tmp/old_roots
      timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
      mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    fi

    delete_subvolume_recursively() {
      IFS=$'\n'
      for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
        delete_subvolume_recursively "/btrfs_tmp/$i"
      done
      btrfs subvolume delete "$1"
    }

    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
      delete_subvolume_recursively "$i"
    done

    if [[ -e /btrfs_tmp/root_blank ]]; then
      delete_subvolume_recursively /btrfs_tmp/root_blank
    fi

    btrfs subvolume create /btrfs_tmp/root
    btrfs subvolume snapshot -r /btrfs_tmp/root /btrfs_tmp/root_blank

    umount /btrfs_tmp
  '';

  # Persist system files
  environment.persistence."/persist/system" = {
    hideMounts = true;
    directories = [
      "/var/lib/nixos" # root:root 0755
      "/var/lib/systemd/coredump" # root:root 0755
      "/var/lib/colord" # root:root 0755
      { directory = "/var/lib/bluetooth"; mode = "0700"; } # root:root 0700
      { directory = "/etc/NetworkManager/system-connections"; mode = "0700"; } # root:root 0700
    ];
    files = [
      "/etc/machine-id"
      "/root/.config/sops/age/keys.txt" # root:root 0755
    ];
  };

  systemd.tmpfiles.rules = [
    "d /persist/home/ 0755 root root -"
    "d /persist/home/kieran 0700 kieran users -"
  ];

  fileSystems."/persist".neededForBoot = true;
  fileSystems."/var/log".neededForBoot = true;

  # Persist home files
  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "kieran" = import ../../home/kieran/default.nix;
    };
  };

  # Sops
  sops.defaultSopsFile = ../../sops/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = /persist/system/root/.config/sops/age/keys.txt;
  sops.secrets."users/kieran/hashedPassword".neededForUsers = true;

  # Users
  users = {
    users = {
      kieran = {
        uid = 1000;
        isNormalUser = true;
        hashedPasswordFile = config.sops.secrets."users/kieran/hashedPassword".path;
        extraGroups = [ "wheel" "networkmanager" ];
        packages = with pkgs; [
          btdu
          discord
          gimp
          jetbrains.idea-community
          keepassxc
          neofetch
          obsidian
          prismlauncher
          steam
        ];
      };
    };
  };

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

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
