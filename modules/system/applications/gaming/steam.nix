{ config, lib, ... }: {
  options.myModules.applications.gaming.steam.enable = lib.mkEnableOption "Enable Steam";

  config = lib.mkIf config.myModules.applications.gaming.steam.enable {
    hardware.graphics.enable32Bit = true;
  };
}
