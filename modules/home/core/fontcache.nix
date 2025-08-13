{ config, lib, osConfig, ... }: {
  options.myModules.core.fontcache.enable = lib.mkEnableOption "Enable fontcache";

  config = lib.mkIf config.myModules.core.fontcache.enable {
    home.persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [ ".cache/fontcache" ];
    };
  };
}
