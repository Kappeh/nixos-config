{ config, lib, ... }: {
  imports = [
    ./scripts/default.nix
    ./terminals.nix
    ./zsh.nix
  ];

  options.kappeh.shell = {
    enable = lib.mkEnableOption "Enable shell capability";

    bat.enable = lib.mkEnableOption "Enable bat";
    btop.enable = lib.mkEnableOption "Enable btop";
    eza.enable = lib.mkEnableOption "Enable eza";
    fastfetch.enable = lib.mkEnableOption "Enable fastfetch";
    fd.enable = lib.mkEnableOption "Enable fd";
    fzf.enable = lib.mkEnableOption "Enable fzf";
    fzf_git_sh.enable = lib.mkEnableOption "Enable fzf_git_sh";
    ripgrep.enable = lib.mkEnableOption "Enable ripgrep";
    tldr.enable = lib.mkEnableOption "Enable tldr";
    tmux.enable = lib.mkEnableOption "Enable tmux";
    tree.enable = lib.mkEnableOption "Enable tree";
    unzip.enable = lib.mkEnableOption "Enable unzip";
    wget.enable = lib.mkEnableOption "Enable wget";
    zip.enable = lib.mkEnableOption "Enable zip";
    zoxide.enable = lib.mkEnableOption "Enable zoxide";
  };

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

