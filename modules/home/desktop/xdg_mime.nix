{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.enable {
    xdg = {
      enable = true;
      mime.enable = true;
      mimeApps.enable = true;
    };
  };
}
