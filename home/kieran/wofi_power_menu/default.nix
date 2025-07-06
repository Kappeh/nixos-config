{ config, pkgs, ... }: {
  config = {
    home.packages = [ pkgs.wofi-power-menu ];

    xdg.configFile."wofi-power-menu.toml" = {
      enable = true;
      executable = false;
      text = builtins.readFile ./wofi-power-menu.toml;
    };
  };
}
