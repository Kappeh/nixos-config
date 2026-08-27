{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.enable {
    services.udisks2.enable = true;
  };
}
