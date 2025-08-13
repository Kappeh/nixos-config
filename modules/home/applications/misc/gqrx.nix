{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.misc.gqrx.enable = lib.mkEnableOption "Enable Gqrx";

  config = lib.mkIf config.myModules.applications.misc.gqrx.enable {
    home = {
      packages = [ pkgs.gqrx ];

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [ ".config/gqrx" ];
      };
    };
  };
}
