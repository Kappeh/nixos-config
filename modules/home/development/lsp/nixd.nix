{ config, lib, pkgs, ... }: {
  options.kappeh.development.lsp.nixd.enable = lib.mkEnableOption "Enable nixd";

  config = lib.mkIf config.kappeh.development.lsp.nixd.enable {
    home.packages = [ pkgs.nixd ];
  };
}

