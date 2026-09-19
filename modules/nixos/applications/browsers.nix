{ config, lib, ... }: {
  options.kappeh.applications.browsers = {
    enable = lib.mkEnableOption "Enable all browsers by default";

    librewolf.enable = lib.mkEnableOption "Enable LibreWolf";
    mullvad_browser.enable = lib.mkEnableOption "Enable Mullvad Browser";
    tor_browser.enable = lib.mkEnableOption "Enable Tor Browser";
  };

  config.kappeh.applications.browsers = with config.kappeh.applications; {
    librewolf.enable = lib.mkDefault browsers.enable;
    mullvad_browser.enable = lib.mkDefault browsers.enable;
    tor_browser.enable = lib.mkDefault browsers.enable;
  };
}

