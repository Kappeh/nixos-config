{ ... }: {
  config = {
    myModules.shares.music_library_1.enable = true;
    networking.firewall.allowedTCPPorts = [ 4533 ];

    systemd.services.navidrome = {
      description = "Compose service navidrome";
      requires = [
        "docker.service"
        "mnt-music_library_1.mount"
      ];
      after = [
        "docker.service"
        "mnt-music_library_1.mount"
      ];

    };
  };
}
