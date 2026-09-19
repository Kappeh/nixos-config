{ config, lib, ... }: {
  config = lib.mkIf config.kappeh.audio.enable {
    home.persistence."/persist".directories = [
      ".config/pulse" # I do not know whether this needs to stick around or not
      ".local/state/wireplumber"
    ];
  };
}

