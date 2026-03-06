{ config, lib, ... }: {
  options.myModules.applications.media.mpd.enable = lib.mkEnableOption "Enable mpd";

  config = lib.mkIf config.myModules.applications.media.mpd.enable {
    services.mpd = {
      enable = true;
      startWhenNeeded = true;

      user = "kieran";
      group = "kieran";

      settings = {
        bind_to_address = "127.0.0.1";
        port = 6600;
        db_file = "/var/lib/mpd/tag_cache";
        music_directory = "/mnt/music_library_1/tracks";
        playlist_directory = "/mnt/music_library_1/playlists";
      };

      dataDir = "/var/lib/mpd";

      settings = {
        audio_output = [
          {
            type = "pipewire";
            name = "PipeWire";
          }
        ];
      };
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
