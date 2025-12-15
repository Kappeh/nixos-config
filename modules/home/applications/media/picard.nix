{ config, lib, pkgs, ... }: {
  options.myModules.applications.media.picard.enable = lib.mkEnableOption "Enable Picard";

  config = lib.mkIf config.myModules.applications.media.picard.enable {
    home = {
      packages = [ pkgs.picard ];

      persistence."/persist/home/${config.home.username}".directories = [
        ".config/MusicBrainz"
      ];
    };
  };
}
