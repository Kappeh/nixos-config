{ config, lib, pkgs, ... }: {
  options.myModules.tools.lsp.nixd.enable = lib.mkEnableOption "Enable nixd";

  config = lib.mkIf config.myModules.tools.lsp.nixd.enable {
    home.packages = [ pkgs.nixd ];
  };
}
