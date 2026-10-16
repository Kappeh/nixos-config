{ config, lib, pkgs, ... }: {
  options.kappeh.applications.wine.enable = lib.mkEnableOption "Enable wine";

  config.home = lib.mkIf config.kappeh.applications.wine.enable {
    persistence."/persist".directories = [
      ".wine"
      ".cache/wine"
    ];

    packages = with pkgs; [
      wineWow64Packages.stable
      winetricks
    ];
  };
}

