{ config, lib, pkgs, ... }: {
  options.myModules.applications.gaming.r2modman.enable = lib.mkEnableOption "Enable r2modman";

  config = lib.mkIf config.myModules.applications.gaming.r2modman.enable {
    home = {
      packages = [ pkgs.r2modman ];

      persistence."/persist/home/${config.home.username}".directories = [
        ".config/r2modman"
        ".config/r2modmanPlus-local"
      ];
    };
  };
}
