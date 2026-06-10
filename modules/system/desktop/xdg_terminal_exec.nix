{ config, ... }: {
  config.xdg.terminal-exec.enable = config.myModules.desktop.enable;
}
