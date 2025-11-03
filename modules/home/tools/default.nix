{ config, lib, ... }: {
  imports = [
    ./bat.nix
    ./bluetui.nix
    ./btdu.nix
    ./btop.nix
    ./eza.nix
    ./f3.nix
    ./fastfetch.nix
    ./fd.nix
    ./fzf_git_sh.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./lf.nix
    ./nix_search_tv.nix
    ./nixvim.nix
    ./playerctl.nix
    ./pulsemixer.nix
    ./tldr.nix
    ./tmux.nix
    ./tree.nix
    ./unzip.nix
    ./wget.nix
    ./xclip.nix
    ./yazi.nix
    ./zip.nix
    ./zoxide.nix
  ];

  options.myModules.tools.enable = lib.mkEnableOption "Enable tools";

  config.myModules.tools = {
    bat.enable = lib.mkDefault config.myModules.tools.enable;
    bluetui.enable = lib.mkDefault config.myModules.tools.enable;
    btdu.enable = lib.mkDefault config.myModules.tools.enable;
    btop.enable = lib.mkDefault config.myModules.tools.enable;
    eza.enable = lib.mkDefault config.myModules.tools.enable;
    f3.enable = lib.mkDefault config.myModules.tools.enable;
    fastfetch.enable = lib.mkDefault config.myModules.tools.enable;
    fd.enable = lib.mkDefault config.myModules.tools.enable;
    fzf_git_sh.enable = lib.mkDefault config.myModules.tools.enable;
    fzf.enable = lib.mkDefault config.myModules.tools.enable;
    gh.enable = lib.mkDefault config.myModules.tools.enable;
    git.enable = lib.mkDefault config.myModules.tools.enable;
    lf.enable = lib.mkDefault config.myModules.tools.enable;
    nix_search_tv.enable = lib.mkDefault config.myModules.tools.enable;
    nixvim.enable = lib.mkDefault config.myModules.tools.enable;
    playerctl.enable = lib.mkDefault config.myModules.tools.enable;
    pulsemixer.enable = lib.mkDefault config.myModules.tools.enable;
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
