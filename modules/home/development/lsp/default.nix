{ config, lib, ... }: {
  imports = [
    ./bashls.nix
    ./docker_compose_ls.nix
    ./docker_ls.nix
    ./nixd.nix
    ./rust_analyzer.nix
  ];

  options.kappeh.development.lsp.enable = lib.mkEnableOption "Enable lsp modules";

  config.kappeh.development.lsp = with config.kappeh.development; {
    bashls.enable = lib.mkDefault lsp.enable;
    docker_compose_ls.enable = lib.mkDefault lsp.enable;
    docker_ls.enable = lib.mkDefault lsp.enable;
    nixd.enable = lib.mkDefault lsp.enable;
    rust_analyzer.enable = lib.mkDefault lsp.enable;
  };
}

