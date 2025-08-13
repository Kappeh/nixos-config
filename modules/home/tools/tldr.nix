{ config, lib, pkgs, ... }: {
  options.myModules.tools.tldr.enable = lib.mkEnableOption "Enable tldr";

  config = lib.mkIf config.myModules.tools.tldr.enable {
    home.packages = [ pkgs.tldr ];
  };
}
