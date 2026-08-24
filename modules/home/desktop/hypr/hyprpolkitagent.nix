{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.hyprland.enable {
    services.hyprpolkitagent.enable = true;
  };
}

