{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.davinci-resolve ];

    persistence."/persist/home/kieran".directories = [
      ".cache/DaVinci_Resolve_Welcome"
      ".local/share/DaVinciResolve"
    ];
  };
}
