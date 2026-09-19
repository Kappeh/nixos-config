{ config, lib, ... }: {
  config = lib.mkIf config.kappeh.desktop.enable {
    programs.dconf.enable = true;
  };
}
