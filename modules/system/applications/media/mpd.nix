{ config, lib, ... }: {
  options.myModules.applications.media.mpd.enable = lib.mkEnableOption "Enable mpd";

  config = lib.mkIf config.myModules.applications.media.mpd.enable {
    systemd.services.mpd.environment = {
      # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
      # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
      XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.kieran.uid}";
    };
  };
}
