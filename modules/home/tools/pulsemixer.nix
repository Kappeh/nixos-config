{ config, lib, pkgs, ... }: {
  options.myModules.tools.pulsemixer.enable = lib.mkEnableOption "Enable pulsemixer";

  config = lib.mkIf config.myModules.tools.pulsemixer.enable {
    home.packages = [ pkgs.pulsemixer ];
  };
}
