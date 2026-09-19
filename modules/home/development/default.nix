{ config, lib, ... }: {
  imports = [
    ./lsp/default.nix
    ./nixvim/default.nix
    ./blender.nix
    ./delta.nix
    ./freecad.nix
    ./gh.nix
    ./git.nix
    ./godot.nix
    ./lazygit.nix
    ./nix_index.nix
    ./nix_search_tv.nix
    ./qmk.nix
    ./via.nix
  ];

  options.kappeh.development.enable = lib.mkEnableOption "Enable development capability";

  config.kappeh.development = with config.kappeh; {
    lsp.enable = lib.mkDefault development.enable;
    nixvim.enable = lib.mkDefault development.enable;
    blender.enable = lib.mkDefault development.enable;
    delta.enable = lib.mkDefault development.enable;
    freecad.enable = lib.mkDefault development.enable;
    gh.enable = lib.mkDefault development.enable;
    git.enable = lib.mkDefault development.enable;
    godot.enable = lib.mkDefault development.enable;
    lazygit.enable = lib.mkDefault development.enable;
    nix_index.enable = lib.mkDefault development.enable;
    nix_search_tv.enable = lib.mkDefault development.enable;
    qmk.enable = lib.mkDefault development.enable;
    via.enable = lib.mkDefault development.enable;
  };
}

