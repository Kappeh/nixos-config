{ config, lib, pkgs, ... }: {
  options.myModules.desktop.udiskie.enable = lib.mkEnableOption "Enable udiskie";

  config = lib.mkIf config.myModules.desktop.udiskie.enable {
    home.packages = [ pkgs.udiskie ];

    services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
  };
}
