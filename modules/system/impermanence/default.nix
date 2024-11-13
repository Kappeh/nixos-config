{ config, lib, ... }: {
  config = {
    boot.initrd.postDeviceCommands = lib.mkAfter (builtins.readFile ./rollback.sh);

    fileSystems = {
      "/backup".neededForBoot = true;
      "/persist".neededForBoot = true;
    };

    environment.persistence."/persist/system" = {
      hideMounts = true;
      directories = [
        "/var/lib/colord"
        "/var/lib/nixos"
        "/var/lib/systemd/coredump"
        "/var/log"
      ];
      files = [
        "/etc/machine-id"
        "/root/.config/sops/age/keys.txt"
      ];
    };

    systemd.tmpfiles.rules = [
      "d /persist/home/ 0755 root root -"
      "d /backup/home/ 0755 root root -"
      "d /persist/home/kieran 0700 kieran users -"
      "d /backup/home/kieran 0700 kieran users -"
      "d /persist/system/ 0755 root root -"
      "d /backup/system/ 0755 root root -"
      "d /persist/system/root 0700 root root -"
      "d /backup/system/root 0700 root root -"
    ];

    # Required by the home manager impermanence module to mount directories
    programs.fuse.userAllowOther = true;

    # Remove security lecture for sudo
    security.sudo.extraConfig = ''
      Defaults lecture = never
    '';
  };
}
