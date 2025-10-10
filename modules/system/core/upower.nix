{ config, lib, ... }: {
  options.myModules.core.upower.enable = lib.mkEnableOption "Enable UPower";

  config.services.upower = lib.mkIf config.myModules.core.upower.enable {
    enable = true;
  };
}
