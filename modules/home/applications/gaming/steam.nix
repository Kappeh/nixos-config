{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.gaming.steam.enable = lib.mkEnableOption "Enable Steam";

  config = {
    # Disable Steam Home Manager module if NixOS module is disabled
    myModules = lib.mkIf (!osConfig.myModules.applications.gaming.steam.enable) {
      applications.gaming.steam.enable = lib.mkForce false;
    };

    home = lib.mkIf config.myModules.applications.gaming.steam.enable {
      packages = [ pkgs.steam ];

      persistence."/persist/home/${config.home.username}".directories = [
        { directory = ".local/share/Steam"; method = "symlink"; }
        { directory = ".local/share/Factorio"; method = "symlink"; }
        { directory = ".factorio"; }
        { directory = ".local/share/FasterThanLight"; method = "symlink"; }
        { directory = ".local/share/IntoTheBreach"; method = "symlink"; }
        { directory = ".local/share/shapez.io"; }
        { directory = ".local/share/Terraria"; }
        { directory = ".local/share/Daedalic Entertainment GmbH"; method = "symlink"; }
        { directory = ".config/UNDERTALE"; method = "symlink"; }
        { directory = ".config/unity3d/Landfall/Haste"; method = "symlink"; }
      ];
    };
  };
}
