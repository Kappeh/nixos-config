{ config, lib, pkgs, ... }: {
  options.myModules.applications.media.davinci_resolve.enable = lib.mkEnableOption "Enable DaVinci Resolve";

  config = lib.mkIf config.myModules.applications.media.davinci_resolve.enable {
    home = {
      packages = [ pkgs.davinci-resolve ];

      persistence."/persist/home/${config.home.username}".directories = [
        ".cache/DaVinci_Resolve_Welcome"
        ".local/share/DaVinciResolve"
      ];
    };
  };
}
