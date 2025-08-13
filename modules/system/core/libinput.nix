{ config, lib, ... }: {
  options.myModules.core.libinput.enable = lib.mkEnableOption "Enable libinput";

  config = lib.mkIf config.myModules.core.libinput.enable {
    services.libinput = {
      enable = true;
      mouse.horizontalScrolling = true;
      mouse.middleEmulation = false;
    };
  };
}
