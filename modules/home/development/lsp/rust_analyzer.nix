{ config, lib, pkgs, ... }: {
  options.kappeh.development.lsp.rust_analyzer.enable = lib.mkEnableOption "Enable rust-analyzer";

  config = lib.mkIf config.kappeh.development.lsp.rust_analyzer.enable {
    home.packages = [ pkgs.rust-analyzer ];
  };
}

