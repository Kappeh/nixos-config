{ config, lib, pkgs, ... }: {
  options.myModules.tools.xclip.enable = lib.mkEnableOption "Enable xclip";

  config = lib.mkIf config.myModules.tools.xclip.enable {
    home.packages = [ pkgs.xclip ];
  };
}
