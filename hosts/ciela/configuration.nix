# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ../../modules/system/sops.nix
    ../../modules/system/ssl/default.nix
    ./hardware-configuration.nix
    inputs.sops-nix.nixosModules.sops
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  boot = {
    # Use the systemd-boot EFI boot loader.
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 100;
      };
      efi.canTouchEfiVariables = true;
    };

    kernelParams = [
      # Network it required during stage 1 for network based unlocking and ssh
      # "rd.neednet=1"
      "ip=10.0.1.5:::255.255.0.0:ciela:eno1:off:10.0.1.1::"
    ];

    initrd = {
      availableKernelModules = [
        "e1000e"
        "ptp"
      ];
      network = {
        enable = true;
        flushBeforeStage2 = false;
        ssh = {
          enable = true;
          hostKeys = [
            "/persist/system/etc/secrets/initrd/ciela_initrd_host_key_ed25519"
          ];
          authorizedKeys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOCUJsStgjTCObc7BrzoGDE3tj633SbghefFM2wk20gX local"
          ];
        };
      };

      systemd.network = {
        enable = true;

        networks = {
          "eno1" = {
            enable = true;
            name = "eno1";
            DHCP = false;
            addresses = [ "10.0.1.5" ];
            gateway = [ "10.0.0.1" ];
            dns = [ "10.0.1.1" ];
          };
        };
        # links = {};
        # netdevs = {};
        # config = {};
      };
    };
  };

  networking = {
    hostName = "ciela"; # Define your hostname.
    # networkmanager.enable = true;  # Easiest to use and most distros use this by default.
    # useDHCP = false;
    # nameservers = [ "10.0.1.1" ];
    # interfaces."eno1" = {
    #   ipv4 = {
    #     addresses = [
    #       {
    #         address = "10.0.1.5";
    #         prefixLength = 16;
    #       }
    #     ];
    #   };
    # };
  };

  systemd.network = {
    enable = true;

    networks = {
      "eno1" = {
        enable = true;
        name = "eno1";
        DHCP = false;
        addresses = [ "10.0.1.5" ];
        gateway = [ "10.0.0.1" ];
        dns = [ "10.0.1.1" ];
      };
    };
    # links = {};
    # netdevs = {};
    # config = {};
  };

  # Set your time zone.
  time.timeZone = "Etc/UTC";

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
  # services.xserver.enable = true;

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

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kieran = {
    uid = 1000;
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."users/kieran/hashedPassword".path;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOCUJsStgjTCObc7BrzoGDE3tj633SbghefFM2wk20gX local"
    ];
    extraGroups = [
      "networkmanager"  # Enable network manager for user
      "wheel"           # Enable `sudo` for the user.
    ];
    packages = with pkgs; [
      tree
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
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
  services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };

    hostKeys = [
      {
        comment = "ciela_host_key_ed25519";
        path = "/persist/etc/ssh/ciela_host_key_ed25519";
        type = "ed25519";
      }
    ];
  };

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
