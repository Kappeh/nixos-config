{ config, lib, pkgs, ... }: {
  options.myModules.applications.browsers.mullvad_browser.enable = lib.mkEnableOption "Enable Mullvad Browser";

  config = lib.mkIf config.myModules.applications.browsers.mullvad_browser.enable {
    home.packages = [ pkgs.mullvad-browser ];
  };
}
