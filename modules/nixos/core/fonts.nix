{ pkgs, ... }: {
  # TODO: see if this is used for terminals or not
  # if not, it can be moved to an optional module
  config = {
    fonts.packages = with pkgs; [
      cascadia-code
      dina-font
      fira-code
      fira-code-symbols
      liberation_ttf
      mplus-outline-fonts.githubRelease
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      proggyfonts
      font-awesome
      jetbrains-mono
      lexend
    ];
  };
}

