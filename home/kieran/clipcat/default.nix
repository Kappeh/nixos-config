{ config, ... }: {
  config.home = {
    file = {
      ".config/clipcat/clipcat-menu.toml".source = ./clipcat-menu.toml;
      ".config/clipcat/clipcatctl.toml".source = ./clipcatctl.toml;
      ".config/clipcat/clipcatd.toml".source = ./clipcatd.toml;
    };

    persistence."/persist/home/kieran".directories = [ ".cache/clipcat" ];
  };
}
