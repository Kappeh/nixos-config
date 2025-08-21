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

  config = lib.mkIf config.myModules.tools.enable {
    myModules.tools = {
      bat.enable = lib.mkDefault true;
      bluetui.enable = lib.mkDefault true;
      btdu.enable = lib.mkDefault true;
      btop.enable = lib.mkDefault true;
      eza.enable = lib.mkDefault true;
      f3.enable = lib.mkDefault true;
      fastfetch.enable = lib.mkDefault true;
      fd.enable = lib.mkDefault true;
      fzf_git_sh.enable = lib.mkDefault true;
      fzf.enable = lib.mkDefault true;
      gh.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      lf.enable = lib.mkDefault true;
      nixvim.enable = lib.mkDefault true;
      playerctl.enable = lib.mkDefault true;
      pulsemixer.enable = lib.mkDefault true;
      tldr.enable = lib.mkDefault true;
      tmux.enable = lib.mkDefault true;
      tree.enable = lib.mkDefault true;
      unzip.enable = lib.mkDefault true;
      wget.enable = lib.mkDefault true;
      xclip.enable = lib.mkDefault true;
      yazi.enable = lib.mkDefault true;
      zip.enable = lib.mkDefault true;
      zoxide.enable = lib.mkDefault true;
    };
  };
}
