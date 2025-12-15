{ config, lib, ... }: {
  options.myModules.applications.media.mpd.enable = lib.mkEnableOption "Enable mpd";

  config = lib.mkIf config.myModules.applications.media.mpd.enable {
    services.mpd = {
      enable = true;
      startWhenNeeded = true;

      user = "kieran";
      group = "kieran";

      musicDirectory = "/mnt/music_library_1/tracks";
      playlistDirectory = "/mnt/music_library_1/playlists";

      network = {
        listenAddress = "127.0.0.1";
        port = 6600;
      };

      dataDir = "/var/lib/mpd";
      dbFile = "/var/lib/mpd/tag_cache";

      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire"
        }
      '';
    };

    systemd.services.mpd = {
      environment = {
        # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
        # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
        XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.kieran.uid}";
      };
    };

    environment.persistence."/persist/system".directories = [ "/var/lib/mpd" ];
  };
}
