{ config, lib, pkgs, ... }: {
  options.myModules.tools.ripgrep.enable = lib.mkEnableOption "Enable ripgrep";

  config = lib.mkIf config.myModules.tools.ripgrep.enable {
    home.packages = [ pkgs.ripgrep ];
  };
}
