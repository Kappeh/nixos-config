{ config, lib, ... }: {
  options.myModules.applications.terminals.kitty.enable = lib.mkEnableOption "Enable Kitty";

  config = lib.mkIf config.myModules.applications.terminals.kitty.enable {
    # stylix.targets.kitty.colors.enable = false;
    programs.kitty = {
      enable = true;

      # https://github.com/nix-community/stylix/issues/1411
      # extraConfig = ''
      #   color0 ${config.lib.stylix.colors.withHashtag.base00}
      #   color1 ${config.lib.stylix.colors.withHashtag.base01}
      #   color2 ${config.lib.stylix.colors.withHashtag.base02}
      #   color3 ${config.lib.stylix.colors.withHashtag.base03}
      #   color4 ${config.lib.stylix.colors.withHashtag.base04}
      #   color5 ${config.lib.stylix.colors.withHashtag.base05}
      #   color6 ${config.lib.stylix.colors.withHashtag.base06}
      #   color7 ${config.lib.stylix.colors.withHashtag.base07}
      #   color8 ${config.lib.stylix.colors.withHashtag.base08}
      #   color9 ${config.lib.stylix.colors.withHashtag.base09}
      #   color10 ${config.lib.stylix.colors.withHashtag.base0A}
      #   color11 ${config.lib.stylix.colors.withHashtag.base0B}
      #   color12 ${config.lib.stylix.colors.withHashtag.base0C}
      #   color13 ${config.lib.stylix.colors.withHashtag.base0D}
      #   color14 ${config.lib.stylix.colors.withHashtag.base0E}
      #   color15 ${config.lib.stylix.colors.withHashtag.base0F}
      # '';

      settings = {
        scrollback_lines = 10000;
        enable_audio_bell = false;
        update_check_interval = 0;
        window_padding_width = 15;
      };
    };
  };
}
