{ config, lib, ... }: {
  config = lib.mkIf config.kappeh.desktop.enable {
    xdg = {
      enable = true;
      mime.enable = true;
      mimeApps.enable = true;
    };
  };
}

