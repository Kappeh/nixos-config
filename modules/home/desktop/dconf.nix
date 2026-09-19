{ config, lib, ... }: {
  config.home = lib.mkIf config.kappeh.desktop.enable {
    persistence."/persist".directories = [ ".config/dconf" ];
  };
}

