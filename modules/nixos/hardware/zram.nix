{ config, lib, ... }: {
  options.kappeh.hardware.zram.enable = lib.mkEnableOption "Enable zram";

  config.zramSwap = lib.mkIf config.kappeh.hardware.zram.enable {
    enable = true;
    memoryPercent = 50;
  };
}

