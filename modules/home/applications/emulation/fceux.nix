{ config, lib, pkgs, ... }: {
  options.myModules.applications.emulation.fceux.enable = lib.mkEnableOption "Enable FCEUX";

  config = lib.mkIf config.myModules.applications.emulation.fceux.enable {
    home.packages = [ pkgs.fceux ];
  };
}
