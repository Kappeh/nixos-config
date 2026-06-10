{ config, lib, ... }: {
  options.myModules.shares.minecraft_server.enable = lib.mkEnableOption "Enable minecraft_server share";

  config.fileSystems."/mnt/minecraft_server" = lib.mkIf config.myModules.shares.minecraft_server.enable {
    device = "omv.home.kappeh.org:/export/minecraft-server";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=600"
    ];
  };
}
