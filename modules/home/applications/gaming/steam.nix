{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.gaming.steam.enable = lib.mkEnableOption "Enable Steam";

  config = {
    # Disable Steam Home Manager module if NixOS module is disabled
    myModules = lib.mkIf (!osConfig.myModules.applications.gaming.steam.enable) {
      applications.gaming.steam.enable = lib.mkForce false;
    };

    home = lib.mkIf config.myModules.applications.gaming.steam.enable {
      packages = [ pkgs.steam ];

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
  };
}
