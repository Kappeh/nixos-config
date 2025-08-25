{ config, lib, pkgs, ... }: {
  options.myModules.desktop.wofi.enable = lib.mkEnableOption "Enable Wofi";

  config = lib.mkIf config.myModules.desktop.wofi.enable {
    stylix.targets.wofi.enable = false;

    programs.wofi = {
      enable = true;

      style = pkgs.replaceVars ./style.css {
        base00 = config.lib.stylix.colors.base00;
        base01 = config.lib.stylix.colors.base01;
        base02 = config.lib.stylix.colors.base02;
        base03 = config.lib.stylix.colors.base03;
        base04 = config.lib.stylix.colors.base04;
        base05 = config.lib.stylix.colors.base05;
        base0D = config.lib.stylix.colors.base0D;
      };

      settings = {
        mode = "drun";
        allow_markup = false;
        allow_images = true;
        image_size = 32;
        term = "alacritty.desktop";
        orientation = "vertical";
        layer = "top";
        prompt = "";
        insensitive = true;
        no_actions = true;
      };
    };
  };
}
