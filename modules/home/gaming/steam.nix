{ config, lib, pkgs, ... }: {
  options.kappeh.gaming.steam.enable = lib.mkEnableOption "Enable Steam";

  config.home = lib.mkIf config.kappeh.gaming.steam.enable {
    persistence."/persist".directories = [
      ".local/share/Steam"
      ".local/share/Factorio"
      ".factorio"
      ".local/share/FasterThanLight"
      ".local/share/IntoTheBreach"
      ".local/share/shapez.io"
      ".local/share/Terraria"
      ".local/share/Daedalic Entertainment GmbH"
      ".config/UNDERTALE"
      ".config/unity3d/Landfall/Haste"
      ".config/millennium"
      ".config/StardewValley"
    ];

    packages = [
      # pkgs.steam
      pkgs.millennium-steam
    ];
  };
}

