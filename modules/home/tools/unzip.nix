{ config, lib, pkgs, ... }: {
  options.myModules.tools.unzip.enable = lib.mkEnableOption "Enable unzip";

  config = lib.mkIf config.myModules.tools.unzip.enable {
    home.packages = [ pkgs.unzip ];
  };
}
