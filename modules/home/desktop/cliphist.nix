{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.myModules.desktop.enable {
    home = {
      packages = [
        pkgs.wl-clipboard
        pkgs.wl-clip-persist
      ];

      persistence."/persist".directories = [ ".cache/cliphist" ];
    };

    services.cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}
