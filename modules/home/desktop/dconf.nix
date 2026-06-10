{ config, lib, ... }: {
  options.myModules.desktop.dconf.enable = lib.mkEnableOption "Enable Dconf";

  config.home = lib.mkIf config.myModules.desktop.dconf.enable {
    persistence."/persist".directories = [ ".config/dconf" ];
  };
}
