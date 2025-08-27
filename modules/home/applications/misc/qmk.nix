{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.misc.qmk.enable = lib.mkEnableOption "Enable QMK";

  config.home = lib.mkIf config.myModules.applications.misc.qmk.enable {
    packages = [ pkgs.qmk ];

    persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [
        "dev/qmk_firmware"
        ".config/qmk/"
      ];
    };
  };
}
