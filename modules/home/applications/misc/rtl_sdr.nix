{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.rtl_sdr.enable = lib.mkEnableOption "Enable Rtl-sdr";

  config = lib.mkIf config.myModules.applications.misc.rtl_sdr.enable {
    home.packages = [ pkgs.rtl-sdr ];
  };
}
