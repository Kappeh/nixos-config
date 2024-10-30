{ config, pkgs, ... }: {
  # Enable non-root access to the firmware of QMK keyboards.
  config.hardware.keyboard.qmk.enable = true;
}
