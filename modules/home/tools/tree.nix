{ config, lib, pkgs, ... }: {
  options.myModules.tools.tree.enable = lib.mkEnableOption "Enable tree";

  config = lib.mkIf config.myModules.tools.tree.enable {
    home.packages = [ pkgs.tree ];
  };
}
