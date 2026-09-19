{ config, lib, ... }: {
  options.kappeh.development.lsp = {
    enable = lib.mkEnableOption "Enable lsp";

    bashls.enable = lib.mkEnableOption "Enable bashls";
    docker_compose_ls.enable = lib.mkEnableOption "Enable docker_compose_ls";
    docker_ls.enable = lib.mkEnableOption "Enable docker_ls";
    nixd.enable = lib.mkEnableOption "Enable nixd";
    rust_analyzer.enable = lib.mkEnableOption "Enable rust_analyzer";
  };

  config.kappeh.development.lsp = with config.kappeh.development; {
    bashls.enable = lib.mkDefault lsp.enable;
    docker_compose_ls.enable = lib.mkDefault lsp.enable;
    docker_ls.enable = lib.mkDefault lsp.enable;
    nixd.enable = lib.mkDefault lsp.enable;
    rust_analyzer.enable = lib.mkDefault lsp.enable;
  };
}

