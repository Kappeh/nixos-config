{ config, lib, pkgs, ... }: {
  options.kappeh.media.krita.enable = lib.mkEnableOption "Enable Krita";

  config.home = lib.mkIf config.kappeh.media.krita.enable {
    persistence."/persist" = {
      files = [
        ".config/kritarc"
        ".config/kritadisplayrc"
      ];
      directories = [
        ".local/share/krita"
      ];
    };

    packages = [ pkgs.krita ];
  };
}

