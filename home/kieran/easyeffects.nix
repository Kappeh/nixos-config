{ config, ... }: {
  config.services.easyeffects = {
    enable = true;

    preset = "Default";
  };
}
