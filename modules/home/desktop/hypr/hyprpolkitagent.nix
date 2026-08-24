{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.enable {
    services.hyprpolkitagent.enable = true;
  };
}

