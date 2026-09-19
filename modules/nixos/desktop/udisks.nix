{ config, lib, ... }: {
  config = lib.mkIf config.kappeh.desktop.enable {
    services.udisks2.enable = true;
  };
}

