{ config, ... }: {
  config.services.libinput = {
    enable = true;
    mouse.horizontalScrolling = true;
    mouse.middleEmulation = false;
  };
}
