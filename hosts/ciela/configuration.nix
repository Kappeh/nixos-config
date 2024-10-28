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

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 100;
    };
    efi.canTouchEfiVariables = true;
  };

  boot.initrd = {
    # Specify kernel modules to be included in the initial RAM disk.
    availableKernelModules = [
      "e1000e"  # Intel network driver for Ethernet devices.
      "ptp"     # Precision Time Protocol support.
    ];

    network = {
      enable = true;  # Enable network support during the initrd phase.
      ssh = {
        enable = true;  # Enable SSH access during the initrd.
        hostKeys = [ "/persist/system/etc/secrets/initrd/ciela_initrd_host_key_ed25519" ];
        authorizedKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOCUJsStgjTCObc7BrzoGDE3tj633SbghefFM2wk20gX local" ];
      };
    };

    systemd = {
      enable = true;  # Enable systemd services in the initrd.
      # Drop the root user straight into the password prompt on connection
      users.root.shell = "/bin/systemd-tty-ask-password-agent";
      network = {
        enable = true;  # Use systemd-networkd in the initrd for network configuration.
        networks."10-eno1" = {
          enable = true;
          name = "eno1";
          DHCP = "no";
          address = [ "10.0.1.5/16" ];
          gateway= [ "10.0.0.1" ];
          dns = [ "10.0.1.1" ];
        };
      };
    };
  };

  networking = {
    hostName = "ciela";           # Define your hostname.
    useDHCP = false;              # Disable dhcp for static ip
    nameservers = [ "10.0.1.1" ]; # Use local dns server
  };

  services.resolved = {
    enable = true;
    fallbackDns = []; # Disable fallback dns server, only use the primary dns server
  };

  # Use the same systemd-networkd configuration as in initrd
  systemd.network = {
    enable = true;
    networks."10-eno1" = {
      enable = true;
      name = "eno1";
      DHCP = "no";
      address = [ "10.0.1.5/16" ];
      gateway= [ "10.0.0.1" ];
      dns = [ "10.0.1.1" ];
    };
  };

  # Set your time zone.
  time.timeZone = "Etc/UTC";

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kieran = {
    uid = 1000;
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."users/kieran/hashedPassword".path;
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOCUJsStgjTCObc7BrzoGDE3tj633SbghefFM2wk20gX local" ];
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
    vim   # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
