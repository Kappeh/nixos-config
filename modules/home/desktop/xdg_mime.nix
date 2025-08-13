{ config, lib, ... }: {
  options.myModules.desktop.xdg_mime.enable = lib.mkEnableOption "Enable xdg mime";

  config = lib.mkIf config.myModules.desktop.xdg_mime.enable {
    xdg = {
      enable = true;
      mime.enable = true;
      mimeApps.enable = true;
    };
  };
}
