# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  fileSystems = {
    "/backup".neededForBoot = true;
    "/persist".neededForBoot = true;
  };

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

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.qemuGuest.enable = true;

  networking.hostName = "leaf-nix";
  time.timeZone = "Etc/UTC";
  networking.networkmanager.enable = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  services.xserver.xkb = {
    layout = "gb";
    options = "eurosign:4,caps:escape";
  };

  # Allow remote updates
  nix.settings.trusted-users = [ "root" "@wheel" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kieran = {
    name = "kieran";
    uid = 1000;
    group = "kieran";
    extraGroups = [ "wheel" ];

    isNormalUser = true;
    createHome = true;
    home = "/home/kieran";

    packages = with pkgs; [
      tree
    ];
  };

  users.groups.kieran = {
    name = "kieran";
    gid = config.users.users.kieran.uid;
    members = [ "kieran" ];
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  environment.sessionVariables = {
    EDITOR = "vim";
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
  system.stateVersion = "25.05"; # Did you read the comment?
}
