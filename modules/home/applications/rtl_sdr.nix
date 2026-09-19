{ config, lib, pkgs, ... }: {
  options.kappeh.applications.rtl_sdr.enable = lib.mkEnableOption "Enable Rtl-sdr";

  config = lib.mkIf config.kappeh.applications.rtl_sdr.enable {
    home.packages = [ pkgs.rtl-sdr ];
  };
}

