{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix

    ./scripts/default.nix
    ./services/default.nix
    ./ssh.nix

    ../../modules/system/default.nix
    ../../modules/users/default.nix

    inputs.sops-nix.nixosModules.sops
  ];

  config = {
    myModules = {
      applications.enable = true;
      core.enable = true;
      desktop.enable = true;
      shells.enable = true;
      virtualisation.enable = true;
    };

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      # Simply for mounting NTFS filesystems such as external drives
      supportedFilesystems = [ "ntfs" ];
      # Specify location of swapfile to use when attempting to resume during boot.
      # https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Manually_specify_hibernate_location
      # resumeDevice = "/dev/mapper/crypt1";
      # kernelParams = [ "resume_offset=56700969" ];
    };

    networking.hostName = "neri";    # Define your hostname.
    time.timeZone = "Europe/London"; # Set your time zone.

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
