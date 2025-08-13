{ config, lib, ... }: {
  options.myModules.applications.misc.rtl_sdr.enable = lib.mkEnableOption "Enable RTL-SDR";

  config = lib.mkIf config.myModules.applications.misc.rtl_sdr.enable {
    hardware.rtl-sdr.enable = true;
  };
}
