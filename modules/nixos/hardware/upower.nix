{ config, lib, ... }: {
  options.kappeh.hardware.upower.enable = lib.mkEnableOption "Enable UPower";

  config.services.upower = lib.mkIf config.kappeh.hardware.upower.enable {
    enable = true;
  };
}

