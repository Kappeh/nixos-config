{ config, lib, pkgs, ... }: {
  options.kappeh.media.picard.enable = lib.mkEnableOption "Enable Picard";

  config.home = lib.mkIf config.kappeh.media.picard.enable {
    persistence."/persist".directories = [
      ".config/MusicBrainz"
    ];

    packages = [ pkgs.picard ];
  };
}

