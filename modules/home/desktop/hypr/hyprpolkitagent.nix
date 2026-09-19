{ config, lib, ... }: {
  config = lib.mkIf config.kappeh.desktop.enable {
    services.hyprpolkitagent.enable = true;
  };
}

