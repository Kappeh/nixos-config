{ config, lib, ... }: {
  options.kappeh.storage.shares.music_library_1.enable = lib.mkEnableOption "Enable music_library_1 share";

  config.fileSystems."/mnt/music_library_1" = lib.mkIf config.kappeh.storage.shares.music_library_1.enable {
    device = "omv.home.kappeh.org:/export/music-library-1";
    fsType = "nfs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=600"
    ];
  };
}

