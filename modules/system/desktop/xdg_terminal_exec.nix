{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.enable {
    xdg.terminal-exec.enable = true;
  };
}
