{ config, lib, pkgs, ... }: {
  options.myModules.tools.btdu.enable = lib.mkEnableOption "Enable btdu";

  config = lib.mkIf config.myModules.tools.btdu.enable {
    home.packages = [ pkgs.btdu ];
  };
}
