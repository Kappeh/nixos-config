{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.media.davinci_resolve.enable = lib.mkEnableOption "Enable DaVinci Resolve";

  config = lib.mkIf config.myModules.applications.media.davinci_resolve.enable {
    home = {
      packages = [ pkgs.davinci-resolve ];

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [
          ".cache/DaVinci_Resolve_Welcome"
          ".local/share/DaVinciResolve"
        ];
      };
    };
  };
}
