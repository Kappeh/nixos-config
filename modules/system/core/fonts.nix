{ config, lib, pkgs, ... }: {
  options.myModules.core.fonts.enable = lib.mkEnableOption "Enable fonts";

  config = lib.mkIf config.myModules.core.fonts.enable {
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
      noto-fonts-emoji
      proggyfonts
      font-awesome
      jetbrains-mono
      lexend
    ];
  };
}
