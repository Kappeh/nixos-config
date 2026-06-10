{ config, lib, ... }: {
  options.myModules.applications.browsers = {
    enable = lib.mkEnableOption "Enable all browsers by default";

    librewolf.enable = lib.mkEnableOption "Enable LibreWolf";
    mullvad_browser.enable = lib.mkEnableOption "Enable Mullvad Browser";
    tor_browser.enable = lib.mkEnableOption "Enable Tor Browser";
  };

  config.myModules.applications.browsers = {
    librewolf.enable = lib.mkDefault config.myModules.applications.browsers.enable;
    mullvad_browser.enable = lib.mkDefault config.myModules.applications.browsers.enable;
    tor_browser.enable = lib.mkDefault config.myModules.applications.browsers.enable;
  };
}
