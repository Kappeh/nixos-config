{ config, lib, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix

    ./initrd.nix
    ./network.nix
    ./services/default.nix
    ./ssh.nix

    ../../modules/system/default.nix
    ../../modules/users/default.nix

    inputs.sops-nix.nixosModules.sops
  ];

  config = {
    myModules = {
      core = {
        home_manager.enable = true;
        opengl.enable = true;
        sops.enable = true;
        ssl.enable = true;
        systemd_boot.enable = true;
      };
      shells.enable = true;
      virtualisation.docker.enable = true;

      users.system.enable = true;
    };

    time.timeZone = "Etc/UTC"; # Set your time zone.

    # Do not hibernate on lid closed
    services.logind = {
      lidSwitch = "ignore";
      lidSwitchDocked = "ignore";
      lidSwitchExternalPower = "ignore";
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
