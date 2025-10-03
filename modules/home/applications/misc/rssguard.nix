{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.rssguard.enable = lib.mkEnableOption "Enable RSS Guard";

  config.home = lib.mkIf config.myModules.applications.misc.rssguard.enable {
    packages = [ pkgs.rssguard ];

    persistence."/persist/home/${config.home.username}".directories = [
      ".config/RSS Guard 4"
    ];
  };
}
