{ config, lib, ... }: {
  imports = [
    ./bashls.nix
    ./docker_compose_ls.nix
    ./docker_ls.nix
    ./nixd.nix
    ./rust_analyzer.nix
  ];

  options.myModules.tools.lsp.enable = lib.mkEnableOption "Enable lsp modules";

  config.myModules.tools.lsp = {
    bashls.enable = lib.mkDefault config.myModules.tools.lsp.enable;
    docker_compose_ls.enable = lib.mkDefault config.myModules.tools.lsp.enable;
    docker_ls.enable = lib.mkDefault config.myModules.tools.lsp.enable;
    nixd.enable = lib.mkDefault config.myModules.tools.lsp.enable;
    rust_analyzer.enable = lib.mkDefault config.myModules.tools.lsp.enable;
  };
}
