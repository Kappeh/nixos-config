{ config, pkgs, ... }: {
  config = {
    home = {
      packages = [
        pkgs.wl-clipboard
        pkgs.wl-clip-persist
      ];

      persistence."/persist/home/kieran".directories = [ ".cache/cliphist" ];
    };

    services.cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}
