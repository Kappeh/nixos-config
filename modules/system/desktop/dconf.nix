{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.enable {
    programs.dconf.enable = true;
  };
}
