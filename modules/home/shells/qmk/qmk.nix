{ config, osConfig, lib, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.qmk ];

    persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [
        "qmk_firmware"
        ".config/qmk/"
      ];
    };
  };
}
