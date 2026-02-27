{ config, lib, pkgs, ... }: {
  options.myModules.tools.lsp.rust_analyzer.enable = lib.mkEnableOption "Enable rust-analyzer";

  config = lib.mkIf config.myModules.tools.lsp.rust_analyzer.enable {
    home.packages = [ pkgs.rust-analyzer ];
  };
}
