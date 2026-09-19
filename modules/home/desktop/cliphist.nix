{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.kappeh.desktop.enable {
    home = {
      persistence."/persist".directories = [ ".cache/cliphist" ];

      packages = [
        pkgs.wl-clipboard
        pkgs.wl-clip-persist
      ];
    };

    services.cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}

