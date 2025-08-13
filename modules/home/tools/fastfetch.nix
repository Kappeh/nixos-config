{ config, lib, pkgs, ... }: {
  options.myModules.tools.fastfetch.enable = lib.mkEnableOption "Enable fastfetch";

  config = lib.mkIf config.myModules.tools.fastfetch.enable {
    home.packages = [ pkgs.fastfetch ];
  };
}
