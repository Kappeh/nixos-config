{ config, lib, pkgs, ... }: {
  options.myModules.applications.gaming.tetrio.enable = lib.mkEnableOption "Enable Tetrio";

  config.home = lib.mkIf config.myModules.applications.gaming.tetrio.enable {
    packages = [ pkgs.tetrio-desktop ];

    persistence."/persist".directories = [
      ".config/tetrio-desktop"
    ];
  };
}
