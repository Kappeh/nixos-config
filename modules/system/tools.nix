{ config, lib, ... }: {
  options.myModules.tools = {
    enable = lib.mkEnableOption "Enable all tools by default";

    bat.enable = lib.mkEnableOption "Enable bat";
    bluetui.enable = lib.mkEnableOption "Enable bluetui";
    btdu.enable = lib.mkEnableOption "Enable btdu";
    btop.enable = lib.mkEnableOption "Enable btop";
    delta.enable = lib.mkEnableOption "Enable delta";
    eza.enable = lib.mkEnableOption "Enable eza";
    f3.enable = lib.mkEnableOption "Enable f3";
    fastfetch.enable = lib.mkEnableOption "Enable fastfetch";
    fd.enable = lib.mkEnableOption "Enable fd";
    fzf_git_sh.enable = lib.mkEnableOption "Enable fzf_git_sh";
    fzf.enable = lib.mkEnableOption "Enable fzf";
    gh.enable = lib.mkEnableOption "Enable gh";
    git.enable = lib.mkEnableOption "Enable git";
    lazygit.enable = lib.mkEnableOption "Enable lazygit";
    lf.enable = lib.mkEnableOption "Enable lf";
    lsp = {
      bashls.enable = lib.mkEnableOption "Enable bashls";
      docker_compose_ls.enable = lib.mkEnableOption "Enable docker_compose_ls";
      docker_ls.enable = lib.mkEnableOption "Enable docker_ls";
      nixd.enable = lib.mkEnableOption "Enable nixd";
      rust_analyzer.enable = lib.mkEnableOption "Enable rust_analyzer";
    };
    nix_index.enable = lib.mkEnableOption "Enable nix_index";
    nix_search_tv.enable = lib.mkEnableOption "Enable nix_search_tv";
    nixvim.enable = lib.mkEnableOption "Enable nixvim";
    playerctl.enable = lib.mkEnableOption "Enable playerctl";
    pulsemixer.enable = lib.mkEnableOption "Enable pulsemixer";
    ripgrep.enable = lib.mkEnableOption "Enable ripgrep";
    tldr.enable = lib.mkEnableOption "Enable tldr";
    tmux.enable = lib.mkEnableOption "Enable tmux";
    tree.enable = lib.mkEnableOption "Enable tree";
    unzip.enable = lib.mkEnableOption "Enable unzip";
    wget.enable = lib.mkEnableOption "Enable wget";
    xclip.enable = lib.mkEnableOption "Enable xclip";
    yazi.enable = lib.mkEnableOption "Enable yazi";
    zip.enable = lib.mkEnableOption "Enable zip";
    zoxide.enable = lib.mkEnableOption "Enable zoxide";
  };

  config.myModules.tools = {
    bat.enable = lib.mkDefault config.myModules.tools.enable;
    bluetui.enable = lib.mkDefault config.myModules.tools.enable;
    btdu.enable = lib.mkDefault config.myModules.tools.enable;
    btop.enable = lib.mkDefault config.myModules.tools.enable;
    delta.enable = lib.mkDefault config.myModules.tools.enable;
    eza.enable = lib.mkDefault config.myModules.tools.enable;
    f3.enable = lib.mkDefault config.myModules.tools.enable;
    fastfetch.enable = lib.mkDefault config.myModules.tools.enable;
    fd.enable = lib.mkDefault config.myModules.tools.enable;
    fzf_git_sh.enable = lib.mkDefault config.myModules.tools.enable;
    fzf.enable = lib.mkDefault config.myModules.tools.enable;
    gh.enable = lib.mkDefault config.myModules.tools.enable;
    git.enable = lib.mkDefault config.myModules.tools.enable;
    lazygit.enable = lib.mkDefault config.myModules.tools.enable;
    lf.enable = lib.mkDefault config.myModules.tools.enable;
    lsp = {
      bashls.enable = lib.mkDefault config.myModules.tools.enable;
      docker_compose_ls.enable = lib.mkDefault config.myModules.tools.enable;
      docker_ls.enable = lib.mkDefault config.myModules.tools.enable;
      nixd.enable = lib.mkDefault config.myModules.tools.enable;
      rust_analyzer.enable = lib.mkDefault config.myModules.tools.enable;
    };
    nix_index.enable = lib.mkDefault config.myModules.tools.enable;
    nix_search_tv.enable = lib.mkDefault config.myModules.tools.enable;
    nixvim.enable = lib.mkDefault config.myModules.tools.enable;
    playerctl.enable = lib.mkDefault config.myModules.tools.enable;
    pulsemixer.enable = lib.mkDefault config.myModules.tools.enable;
    ripgrep.enable = lib.mkDefault config.myModules.tools.enable;
    tldr.enable = lib.mkDefault config.myModules.tools.enable;
    tmux.enable = lib.mkDefault config.myModules.tools.enable;
    tree.enable = lib.mkDefault config.myModules.tools.enable;
    unzip.enable = lib.mkDefault config.myModules.tools.enable;
    wget.enable = lib.mkDefault config.myModules.tools.enable;
    xclip.enable = lib.mkDefault config.myModules.tools.enable;
    yazi.enable = lib.mkDefault config.myModules.tools.enable;
    zip.enable = lib.mkDefault config.myModules.tools.enable;
    zoxide.enable = lib.mkDefault config.myModules.tools.enable;
  };
}
