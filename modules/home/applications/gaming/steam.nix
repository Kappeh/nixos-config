{ config, lib, pkgs, ... }: {
  options.myModules.applications.gaming.steam.enable = lib.mkEnableOption "Enable Steam";

  config.home = lib.mkIf config.myModules.applications.gaming.steam.enable {
    packages = with pkgs; [
      protontricks
      steam
    ];

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
    ];
  };
}
