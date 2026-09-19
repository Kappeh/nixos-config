{ config, lib, ... }: {
  imports = [
    ./librewolf.nix
    ./mullvad_browser.nix
    ./tor_browser.nix
  ];

  options.kappeh.applications.browsers.enable = lib.mkEnableOption "Enable browsers";

  config = {
    kappeh.applications.browsers = with config.kappeh.applications; {
      librewolf.enable = lib.mkDefault browsers.enable;
      mullvad_browser.enable = lib.mkDefault browsers.enable;
      tor_browser.enable = lib.mkDefault browsers.enable;
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

