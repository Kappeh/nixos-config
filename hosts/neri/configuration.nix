{ config, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../templates/desktop/default.nix

    ./boot.nix
    ./filesystems.nix
    ./network.nix
    ./smartmontools.nix
  ];

  config = {
    sops.secrets.wg0 = {
      format = "binary";
      sopsFile = ../../secrets/wg0;
    };
    networking.wg-quick.interfaces.wg0 = {
      type = "wireguard";
      configFile = config.sops.secrets."wg0".path;
      dns = [ "10.0.1.104" ];
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
