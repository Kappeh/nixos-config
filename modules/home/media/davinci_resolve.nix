{ config, lib, pkgs, ... }: {
  options.kappeh.media.davinci_resolve.enable = lib.mkEnableOption "Enable DaVinci Resolve";

  config.home = lib.mkIf config.kappeh.media.davinci_resolve.enable {
    persistence."/persist".directories = [
      ".cache/DaVinci_Resolve_Welcome"
      ".local/share/DaVinciResolve"
    ];

    packages = [ pkgs.davinci-resolve ];
  };
}

