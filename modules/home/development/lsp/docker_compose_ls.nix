{ config, lib, pkgs, ... }: {
  options.kappeh.development.lsp.docker_compose_ls.enable = lib.mkEnableOption "Enable docker-compose-language-service";

  config = lib.mkIf config.kappeh.development.lsp.docker_compose_ls.enable {
    home.packages = [ pkgs.docker-compose-language-service ];
  };
}

