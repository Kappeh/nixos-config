{ config, lib, ... }: {
  config = lib.mkIf config.kappeh.desktop.enable {
    xdg.terminal-exec.enable = true;
  };
}

