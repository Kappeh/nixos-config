{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.qmk.enable = lib.mkEnableOption "Enable QMK";

  config = lib.mkIf config.myModules.applications.misc.qmk.enable {
    # Enable non-root access to the firmware of QMK keyboards.
    hardware.keyboard.qmk.enable = true;
  };
}
