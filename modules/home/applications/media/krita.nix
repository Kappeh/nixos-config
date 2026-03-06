{ config, lib, pkgs, ... }: {
  options.myModules.applications.media.krita.enable = lib.mkEnableOption "Enable Krita";

  config.home = lib.mkIf config.myModules.applications.media.krita.enable {
    packages = [ pkgs.krita ];

    persistence."/persist" = {
      files = [
        ".config/kritarc"
        ".config/kritadisplayrc"
      ];
      directories = [
        ".local/share/krita"
      ];
    };
  };
}
