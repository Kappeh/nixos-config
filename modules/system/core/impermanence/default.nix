{ config, lib, ... }: {
  options.myModules.core.impermanence.enable = lib.mkEnableOption "Enable impermanence";

  config = {
    boot.initrd.postDeviceCommands = lib.mkIf config.myModules.core.impermanence.enable (
      lib.mkAfter (builtins.readFile ./rollback.sh)
    );

    fileSystems = {
      "/backup".neededForBoot = true;
      "/persist".neededForBoot = true;
    };

    # Required by the home manager impermanence module to mount directories
    programs.fuse.userAllowOther = true;

    # https://nixos.org/manual/nixos/stable/#sec-systemd-state

    users.mutableUsers = false;
    environment.persistence."/persist/system" = {
      hideMounts = true;

      # `systemd` uses per-machine identifiers ... which must be
      # unique and persistent; otherwise, the journal may fail to list
      # earlier boots, etc.
      files = [ "/etc/machine-id" ];

      directories = [
        # State needed to generate stable uids and gids for
        # declaratively-managed users and groups, etc.
        "/var/lib/nixos"

        # `systemd` expects its state directory to persist for
        # many things
        "/var/lib/systemd"

        # `systemd-journald` writes the system's journal in binary
        # form to `/var/log/journal/{machine-id}`.
        "/var/log"

        # Persistent XRandR monitor profiles.
        "/var/lib/colord"
      ];
    };

    # I don't know where this came from.
    # I don't know if it is required or not.
    # TODO: Investigate.
    # systemd.tmpfiles.rules = builtins.concatLists [
    #   [
    #     "d /persist/home/ 0755 root root -"
    #     "d /backup/home/ 0755 root root -"
    #     "d /persist/system/ 0755 root root -"
    #     "d /backup/system/ 0755 root root -"
    #     "d /persist/system/root 0700 root root -"
    #     "d /backup/system/root 0700 root root -"
    #   ]
    #   (lib.optionals config.myModules.users.normal.kieran.enable [
    #     "d /persist/home/kieran 0700 kieran users -"
    #     "d /backup/home/kieran 0700 kieran users -"
    #   ])
    # ];

    # Remove security lecture for sudo
    security.sudo.extraConfig = ''
      Defaults lecture = never
    '';
  };
}
