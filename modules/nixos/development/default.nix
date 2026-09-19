{ config, lib, ... }: {
  imports = [
    ./lsp.nix
    ./qmk.nix
    ./via.nix
    ./vim.nix
  ];

  options.kappeh.development = {
    enable = lib.mkEnableOption "Enable development capability";

    nixvim.enable = lib.mkEnableOption "Enable NixVim";
    blender.enable = lib.mkEnableOption "Enable Blender";
    delta.enable = lib.mkEnableOption "Enable delta";
    freecad.enable = lib.mkEnableOption "Enable freecad";
    gh.enable = lib.mkEnableOption "Enable gh";
    git.enable = lib.mkEnableOption "Enable git";
    godot.enable = lib.mkEnableOption "Enable godot";
    lazygit.enable = lib.mkEnableOption "Enable lazygit";
    nix_index.enable = lib.mkEnableOption "Enable nix_index";
    nix_search_tv.enable = lib.mkEnableOption "Enable nix_search_tv";
  };

  config.kappeh.development = with config.kappeh; {
    lsp.enable = lib.mkDefault development.enable;
    qmk.enable = lib.mkDefault development.enable;
    via.enable = lib.mkDefault development.enable;

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
  };
}

