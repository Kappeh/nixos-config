{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.desktop.cliphist.enable = lib.mkEnableOption "Enable ClipHist";

  config = lib.mkIf config.myModules.desktop.cliphist.enable {
    home = {
      packages = [
        pkgs.wl-clipboard
        pkgs.wl-clip-persist
      ];

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [ ".cache/cliphist" ];
      };
    };

    services.cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}
