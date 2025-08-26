{ config, lib, osConfig, ... }: {
  options.myModules.desktop.swww.enable = lib.mkEnableOption "Enable swww";

  config = lib.mkIf config.myModules.desktop.swww.enable {
    services.swww.enable = true;

    home.persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [ ".cache/swww" ];
    };
  };
}
