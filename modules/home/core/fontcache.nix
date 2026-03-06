{ config, lib, ... }: {
  options.myModules.core.fontcache.enable = lib.mkEnableOption "Enable fontcache";

  config = lib.mkIf config.myModules.core.fontcache.enable {
    home.persistence."/persist".directories = [ ".cache/fontcache" ];
  };
}
