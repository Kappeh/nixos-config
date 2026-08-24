{ config, lib, ... }: {
  config.home = lib.mkIf config.myModules.desktop.enable {
    persistence."/persist".directories = [ ".config/dconf" ];
  };
}
