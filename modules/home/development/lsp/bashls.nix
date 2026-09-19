{ config, lib, pkgs, ... }: {
  options.kappeh.development.lsp.bashls.enable = lib.mkEnableOption "Enable bash-language-server";

  config = lib.mkIf config.kappeh.development.lsp.bashls.enable {
    home.packages = [ pkgs.bash-language-server ];
  };
}

