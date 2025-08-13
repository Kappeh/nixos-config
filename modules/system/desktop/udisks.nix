{ config, lib, ... }: {
  options.myModules.desktop.udisks.enable = lib.mkEnableOption "Enable udisks";

  config = lib.mkIf config.myModules.desktop.udisks.enable {
    services.udisks2.enable = true;
  };
}
