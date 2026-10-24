{ config, lib, pkgs, ... }: {
  options.kappeh.development.qmk.enable = lib.mkEnableOption "Enable QMK";

  config.home = lib.mkIf config.kappeh.development.qmk.enable {
    persistence."/persist".directories = [
      ".config/qmk/"
    ];

    packages = [ pkgs.qmk ];
  };
}

