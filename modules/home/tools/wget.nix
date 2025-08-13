{ config, lib, pkgs, ... }: {
  options.myModules.tools.wget.enable = lib.mkEnableOption "Enable wget";

  config = lib.mkIf config.myModules.tools.wget.enable {
    home.packages = [ pkgs.wget ];
  };
}
