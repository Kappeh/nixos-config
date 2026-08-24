{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.myModules.desktop.enable {
    home.packages = [ pkgs.udiskie ];

    services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
  };
}
