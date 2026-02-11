{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../templates/server/default.nix
  ];

  config = {
    networking.hostName = "leaf";
    systemd.network.networks."10-ens18".address = [ "10.0.1.100/16" ];

    # /var/log was moved into a seperate subvolumes on host `neri`
    # this is here to keep it in the `persist` subvolume for now on this host
    environment.persistence."/persist/system".directories = [
      "/var/log"
    ];

    # Sysctl settings to enable Wake-on-LAN functionality by allowing broadcast
    # packet forwarding and ensuring the server responds to broadcast ICMP pings.
    # These settings are necessary for Home Assistant's ability to send WOL magic packets.
    boot.kernel.sysctl = {
      "net.ipv4.icmp_echo_ignore_broadcasts" = 0;
      "net.ipv4.conf.all.bc_forwarding" = 1;
      "net.ipv4.conf.ens18.bc_forwarding" = 1;
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
