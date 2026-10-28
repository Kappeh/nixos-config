{ config, lib, ... }: {
  options.kappeh.hardware.zswap.enable = lib.mkEnableOption "Enable zswap";

  config.boot = lib.mkIf config.kappeh.hardware.zswap.enable {
    kernel.sysctl."vm.swappiness" = 100;
    zswap = {
      enable = true;
      acceptThresholdPercent = 90;
      maxPoolPercent = 25;
      compressor = "zstd"; # fastest
      shrinkerEnabled = true;
      zpool = "zsmalloc";
    };
  };
}

