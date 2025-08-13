{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.messaging.element_desktop.enable = lib.mkEnableOption "Enable Element";

  config = lib.mkIf config.myModules.applications.messaging.element_desktop.enable {
    home = {
      packages = [ pkgs.element-desktop ];

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [ ".config/Element" ];
      };
    };
  };
}
