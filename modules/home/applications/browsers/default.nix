{ config, lib, ... }: {
  imports = [
    ./firefox.nix
    ./librewolf.nix
    ./tor_browser.nix
  ];

  options.myModules.applications.browsers.enable = lib.mkEnableOption "Enable browsers";

  config = lib.mkIf config.myModules.applications.browsers.enable {
    myModules.applications.browsers = {
      firefox.enable = lib.mkDefault true;
      librewolf.enable = lib.mkDefault true;
      tor_browser.enable = lib.mkDefault true;
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
