{ config, lib, pkgs, ... }: {
  options.myModules.tools.zip.enable = lib.mkEnableOption "Enable zip";

  config = lib.mkIf config.myModules.tools.zip.enable {
    home.packages = [ pkgs.zip ];
  };
}
