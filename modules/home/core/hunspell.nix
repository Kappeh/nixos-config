{ config, lib, pkgs, ... }: {
  options.myModules.core.hunspell.enable = lib.mkEnableOption "Enable Hunspell";

  config = lib.mkIf config.myModules.core.hunspell.enable {
    home.packages = with pkgs; [
      hunspell
      hunspellDicts.en_GB-ise
    ];
  };
}
