{ config, lib, ... }: {
  options.kappeh.development.qmk.enable = lib.mkEnableOption "Enable QMK";

  config = lib.mkIf config.kappeh.development.qmk.enable {
    # Enable non-root access to the firmware of QMK keyboards.
    hardware.keyboard.qmk.enable = true;
  };
}

