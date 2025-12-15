{ config, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../templates/desktop/default.nix
  ];

  config = {
    networking.hostName = "neri";

    boot.supportedFilesystems = [ "nfs" ];

    environment.persistence."/persist/system".directories = [ "/mnt/" ];

    fileSystems."/mnt/music_library_1" = {
      device = "omv.home.kappeh.org:/export/music-library-1";
      fsType = "nfs";
      options = [
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
      ];
    };

    myModules.core.networkmanager.enable = false;

    networking = {
      useDHCP = false;              # Disable dhcp for static ip
      nameservers = [ "10.0.1.1" ]; # Use local dns server
    };

    systemd.network = {
      enable = true;
      networks."10-enp3s0" = {
        enable = true;
        name = "enp3s0";
        DHCP = "no";
        address = [ "10.0.69.69/16" ];
        gateway = [ "10.0.0.1" ];
        dns = [ "10.0.1.1" ];
      };
    };

    services.resolved = {
      enable = true;
      fallbackDns = []; # Disable fallback dns server, only use the primary dns server
    };

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
