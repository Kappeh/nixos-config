{ ... }: {
  # Use vim as the default editor
  environment.systemPackages = [ pkgs.vim ];
  environment.sessionVariables.EDITOR = "vim";
}
