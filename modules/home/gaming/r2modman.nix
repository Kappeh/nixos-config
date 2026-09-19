{ config, lib, pkgs, ... }: {
  options.kappeh.gaming.r2modman.enable = lib.mkEnableOption "Enable r2modman";

  config.home = lib.mkIf config.kappeh.gaming.r2modman.enable {
    persistence."/persist".directories = [
      ".config/r2modman"
      ".config/r2modmanPlus-local"
    ];

    packages = [ pkgs.r2modman ];
  };
}

