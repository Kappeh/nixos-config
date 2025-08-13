{ config, lib, pkgs, ... }: {
  options.myModules.tools.bluetui.enable = lib.mkEnableOption "Enable bluetui";

  config = lib.mkIf config.myModules.tools.bluetui.enable {
    home.packages = [ pkgs.bluetui ];
  };
}
