{ config, ... }: {
  config.services.udisks2.enable = config.myModules.desktop.enable;
}
