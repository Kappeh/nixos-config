{ config, lib, pkgs, ... }: {
  options.kappeh.applications.browsers.mullvad_browser.enable = lib.mkEnableOption "Enable Mullvad Browser";

  config = lib.mkIf config.kappeh.applications.browsers.mullvad_browser.enable {
    home.packages = [ pkgs.mullvad-browser ];
  };
}

