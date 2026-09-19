{ config, lib, pkgs, ... }: {
  options.kappeh.development.lsp.docker_ls.enable = lib.mkEnableOption "Enable docker-ls";

  config = lib.mkIf config.kappeh.development.lsp.docker_ls.enable {
    home.packages = [ pkgs.docker-ls ];
  };
}

