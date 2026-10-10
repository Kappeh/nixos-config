{ inputs, ... }: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  config = {
    # Required by the home manager impermanence module to mount directories
    programs.fuse.userAllowOther = true;

    # https://nixos.org/manual/nixos/stable/#sec-systemd-state

    environment.persistence."/persist/system" = {
      hideMounts = true;

      # `systemd` uses per-machine identifiers ... which must be
      # unique and persistent; otherwise, the journal may fail to list
      # earlier boots, etc.
      files = [ "/etc/machine-id" ];

      # TODO: See if these are better moved elsewhere
      directories = [
        # State needed to generate stable uids and gids for
        # declaratively-managed users and groups, etc.
        "/var/lib/nixos"

        # `systemd` expects its state directory to persist for
        # many things
        "/var/lib/systemd"

        # `systemd-journald` writes the system's journal in binary
        # form to `/var/log/journal/{machine-id}`.
        # "/var/log"

        # Persistent XRandR monitor profiles.
        "/var/lib/colord"

        "/mnt"
      ];
    };
  };
}

