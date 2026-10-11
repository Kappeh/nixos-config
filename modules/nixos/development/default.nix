{ config, lib, ... }: {
  imports = [
    ./binfmt.nix
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
    nix_output_monitor.enable = lib.mkEnableOption "Enable nix-output-monitor";
    nix_search_tv.enable = lib.mkEnableOption "Enable nix_search_tv";
  };

  config.kappeh.development = with config.kappeh; {
    binfmt.enable = lib.mkDefault development.enable;
    lsp.enable = lib.mkDefault development.enable;
    qmk.enable = lib.mkDefault development.enable;
    via.enable = lib.mkDefault development.enable;

    nixvim.enable = lib.mkDefault development.enable;
    blender.enable = lib.mkDefault development.enable;
    delta.enable = lib.mkDefault development.enable;
    freecad.enable = lib.mkDefault false; # Disabled due to build error
    gh.enable = lib.mkDefault development.enable;
    git.enable = lib.mkDefault development.enable;
    godot.enable = lib.mkDefault development.enable;
    lazygit.enable = lib.mkDefault development.enable;
    nix_index.enable = lib.mkDefault development.enable;
    nix_output_monitor.enable = lib.mkDefault development.enable;
    nix_search_tv.enable = lib.mkDefault development.enable;
  };
}

