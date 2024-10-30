{ config, ... }: {
  config.programs.gamemode = {
    enable = true;
    settings.general.renice = 10;
  };
}
