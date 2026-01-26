{ pkgs, ... }: {
  imports = [
    ./backup.nix
    ./update_blacklist.nix
  ];

  config = {
    fileSystems."/mnt/minecraft_server" = {
      device = "omv.home.kappeh.org:/export/minecraft-server";
      fsType = "nfs";
      options = [
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
      ];
    };

    users = {
      users.minecraft_server = {
        uid = 2015;
        group = "minecraft_server";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      groups.minecraft_server = {
        name = "minecraft_server";
        gid = 2015;
        members = [
          "minecraft_server"
          "kieran"
        ];
      };
    };
  };
}
