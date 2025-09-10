{ config, lib, pkgs, ... }: {
  options.myModules.applications.browsers.tor_browser.enable = lib.mkEnableOption "Enable Tor Browser";

  config = lib.mkIf config.myModules.applications.browsers.tor_browser.enable {
    home.packages = [ pkgs.tor-browser ];
  };
}
