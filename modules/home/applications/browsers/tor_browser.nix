{ config, lib, pkgs, ... }: {
  options.kappeh.applications.browsers.tor_browser.enable = lib.mkEnableOption "Enable Tor Browser";

  config = lib.mkIf config.kappeh.applications.browsers.tor_browser.enable {
    home.packages = [ pkgs.tor-browser ];
  };
}

