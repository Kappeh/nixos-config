{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.steam ];

    persistence."/storage/home/kieran".directories = [
      { directory = ".local/share/Steam"; method = "symlink"; }
      { directory = ".local/share/Factorio"; method = "symlink"; }
      { directory = ".factorio"; }
      { directory = ".local/share/FasterThanLight"; method = "symlink"; }
      { directory = ".local/share/IntoTheBreach"; method = "symlink"; }
      { directory = ".local/share/Terraria"; }
      { directory = ".local/share/Daedalic Entertainment GmbH"; method = "symlink"; }
      { directory = ".config/UNDERTALE"; method = "symlink"; }
      { directory = ".config/unity3d/Landfall/Haste"; method = "symlink"; }
    ];
  };
}
