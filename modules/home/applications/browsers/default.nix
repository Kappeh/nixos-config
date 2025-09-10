{ config, lib, ... }: {
  imports = [
    ./firefox.nix
    ./librewolf.nix
    ./mullvad_browser.nix
    ./tor_browser.nix
  ];

  options.myModules.applications.browsers.enable = lib.mkEnableOption "Enable browsers";

  config = {
    myModules.applications.browsers = {
      firefox.enable = lib.mkDefault config.myModules.applications.browsers.enable;
      librewolf.enable = lib.mkDefault config.myModules.applications.browsers.enable;
      mullvad_browser.enable = lib.mkDefault config.myModules.applications.browsers.enable;
      tor_browser.enable = lib.mkDefault config.myModules.applications.browsers.enable;
    };

    # TODO find a better way to do these
    home.sessionVariables.MOX_USE_XINPUT2 = "1"; # Smooth scrolling in Firefox
    xdg.mimeApps.defaultApplications = {
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
    };
  };
}
