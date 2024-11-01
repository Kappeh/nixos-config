{ config, pkgs, ... }: {
  config.home.packages = with pkgs; [
    hunspell
    hunspellDicts.en_GB-ise
  ];
}
