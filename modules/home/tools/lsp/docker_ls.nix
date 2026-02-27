{ config, lib, pkgs, ... }: {
  options.myModules.tools.lsp.docker_ls.enable = lib.mkEnableOption "Enable docker-ls";

  config = lib.mkIf config.myModules.tools.lsp.docker_ls.enable {
    home.packages = [ pkgs.docker-ls ];
  };
}
