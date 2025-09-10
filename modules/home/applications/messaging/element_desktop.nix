{ config, lib, pkgs, ... }: {
  options.myModules.applications.messaging.element_desktop.enable = lib.mkEnableOption "Enable Element";

  # Does not work due to electron bug
  #
  # Use Secret Service API in DBus to attempt to autodiscover secret provider
  # https://github.com/electron/electron/issues/47436
  # Safestorage detection fails on linux outside of predefined desktop environments
  # https://github.com/electron/electron/issues/39789

  config = lib.mkIf config.myModules.applications.messaging.element_desktop.enable {
    home = {
      packages = [ pkgs.element-desktop ];

      persistence."/persist/home/${config.home.username}".directories = [ ".config/Element" ];
    };
  };
}
