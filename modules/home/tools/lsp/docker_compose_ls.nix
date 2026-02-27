{ config, lib, pkgs, ... }: {
  options.myModules.tools.lsp.docker_compose_ls.enable = lib.mkEnableOption "Enable docker-compose-language-service";

  config = lib.mkIf config.myModules.tools.lsp.docker_compose_ls.enable {
    home.packages = [ pkgs.docker-compose-language-service ];
  };
}
