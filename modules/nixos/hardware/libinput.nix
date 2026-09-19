{ config, lib, ... }: {
  options.kappeh.hardware.libinput.enable = lib.mkEnableOption "Enable libinput";

  config = lib.mkIf config.kappeh.hardware.libinput.enable {
    services.libinput = {
      enable = true;
      mouse.horizontalScrolling = true;
      mouse.middleEmulation = false;
    };
  };
}

