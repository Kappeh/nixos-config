{ config, lib, ... }: {
  options.myModules.core.zram.enable = lib.mkEnableOption "Enable zram";

  config.zramSwap = lib.mkIf config.myModules.core.zram.enable {
    enable = true;
    memoryPercent = 50;
  };
}
