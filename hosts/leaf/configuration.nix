{
  imports = [
    ./filesystems.nix
    ./hardware-configuration.nix

    ../../modules/profiles/server.nix
  ];

  config = {
    services.qemuGuest.enable = true;

    boot.supportedFilesystems = [ "nfs" ];

    time.timeZone = "Etc/UTC";    # Set your time zone.

    networking = {
      hostName = "leaf";
      useDHCP = false;              # Disable dhcp for static ip
      nameservers = [ "10.0.1.104" ]; # Use local dns server
    };

    systemd.network = {
      enable = true;
      networks."10-ens18" = {
        enable = true;
        address = [ "10.0.1.100/16" ];
        name = "ens18";
        DHCP = "no";
        gateway = [ "10.0.0.1" ];
        dns = [ "10.0.1.104" ];
      };
    };

    services.resolved = {
      enable = true;
      settings.Resolve.FallbackDns = []; # Disable fallback dns server, only use the primary dns server
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
