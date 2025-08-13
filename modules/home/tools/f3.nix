{ config, lib, pkgs, ... }: {
  options.myModules.tools.f3.enable = lib.mkEnableOption "Enable f3";

  config = lib.mkIf config.myModules.tools.f3.enable {
    home.packages = [ pkgs.f3 ];
  };
}
