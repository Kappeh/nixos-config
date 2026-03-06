{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.qmk.enable = lib.mkEnableOption "Enable QMK";

  config.home = lib.mkIf config.myModules.applications.misc.qmk.enable {
    packages = [ pkgs.qmk ];

    persistence."/persist".directories = [
      "dev/qmk_firmware"
      ".config/qmk/"
    ];
  };
}
