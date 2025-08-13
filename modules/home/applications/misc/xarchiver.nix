{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.xarchiver.enable = lib.mkEnableOption "Enable Xarchiver";

  config = lib.mkIf config.myModules.applications.misc.xarchiver.enable {
    home.packages = [ pkgs.xarchiver ];
  };
}
