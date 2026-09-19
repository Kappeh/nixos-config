{ config, lib, ... }: {
  imports = [
    ./bash/default.nix
    ./terminals/default.nix
    ./bat.nix
    ./btop.nix
    ./eza.nix
    ./fastfetch.nix
    ./fd.nix
    ./fzf.nix
    ./fzf_git_sh.nix
    ./ripgrep.nix
    ./tldr.nix
    ./tmux.nix
    ./tree.nix
    ./unzip.nix
    ./wget.nix
    ./zip.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  options.kappeh.shell.enable = lib.mkEnableOption "Enable shell capability";

  config.kappeh.shell = with config.kappeh; {
    terminals.enable = lib.mkDefault shell.enable;
    bat.enable = lib.mkDefault shell.enable;
    btop.enable = lib.mkDefault shell.enable;
    eza.enable = lib.mkDefault shell.enable;
    fastfetch.enable = lib.mkDefault shell.enable;
    fd.enable = lib.mkDefault shell.enable;
    fzf.enable = lib.mkDefault shell.enable;
    fzf_git_sh.enable = lib.mkDefault shell.enable;
    ripgrep.enable = lib.mkDefault shell.enable;
    tldr.enable = lib.mkDefault shell.enable;
    tmux.enable = lib.mkDefault shell.enable;
    tree.enable = lib.mkDefault shell.enable;
    unzip.enable = lib.mkDefault shell.enable;
    wget.enable = lib.mkDefault shell.enable;
    zip.enable = lib.mkDefault shell.enable;
    zoxide.enable = lib.mkDefault shell.enable;
  };
}

