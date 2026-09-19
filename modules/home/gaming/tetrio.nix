{ config, lib, pkgs, ... }: {
  options.kappeh.gaming.tetrio.enable = lib.mkEnableOption "Enable Tetrio";

  config.home = lib.mkIf config.kappeh.gaming.tetrio.enable {
    persistence."/persist".directories = [
      ".config/tetrio-desktop"
    ];

    packages = [ pkgs.tetrio-desktop ];
  };
}

