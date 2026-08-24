{ config, ... }: {
  config.programs.dconf.enable = config.myModules.desktop.enable;
}
