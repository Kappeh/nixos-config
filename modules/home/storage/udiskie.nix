{ config, lib, pkgs, ... }: {
  options.kappeh.storage.udiskie.enable = lib.mkEnableOption "Enable udiskie";

  config = lib.mkIf config.kappeh.storage.udiskie.enable {
    home.packages = [ pkgs.udiskie ];

    services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
  };
}

