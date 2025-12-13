{ config, lib, osConfig, ... }: {
  options.myModules.applications.media.mpd.enable = lib.mkEnableOption "Enable mpd";

  config = {
    # Disable Home Manager module if NixOS module is disabled
    myModules = lib.mkIf (!osConfig.myModules.applications.media.mpd.enable) {
      applications.media.mpd.enable = lib.mkForce false;
    };

    services = lib.mkIf config.myModules.applications.media.mpd.enable {
      mpd = {
        enable = true;
        musicDirectory = "/mnt/music_library_1/tracks";
        playlistDirectory = "/mnt/music_library_1/playlists";
        extraConfig = ''
          audio_output {
            type "pipewire"
            name "PipeWire"
          }
        '';
      };
      mpd-mpris.enable = true;
    };

    home = lib.mkIf config.myModules.applications.media.mpd.enable {
      persistence."/persist/home/${config.home.username}".directories = [ ".local/share/mpd" ];
    };
  };
}
