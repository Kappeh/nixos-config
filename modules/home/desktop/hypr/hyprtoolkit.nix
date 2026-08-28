{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.enable {
    programs.hyprtoolkit = {
      enable = true;

      settings = {
        background = "0xFF${config.lib.stylix.colors.base00}";
        base = "0xFF${config.lib.stylix.colors.base01}";
        text = "0xFF${config.lib.stylix.colors.base05}";
        alternate_base = "0xFF${config.lib.stylix.colors.base02}";
        bright_text = "0xFF${config.lib.stylix.colors.base07}";
        accent = "0xFF${config.lib.stylix.colors.base0D}";
        accent_secondary = "0xFF${config.lib.stylix.colors.base0E}";

        h1_size = 19;
        h2_size = 15;
        h3_size = 13;
        font_size = 11;
        small_font_size = 10;

        # icon_theme = null;
        font_family = "${config.stylix.fonts.sansSerif.name}";
        font_family_monospace = "${config.stylix.fonts.monospace.name}";

        rounding_large = 0;
        rounding_small = 0;
      };
    };
  };
}

