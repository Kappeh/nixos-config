{ config, lib, ... }: {
  options.myModules.applications.media.cava.enable = lib.mkEnableOption "Enable Cava";

  config = lib.mkIf config.myModules.applications.media.cava.enable {
    programs.cava = {
      enable = true;
      settings = {
        general = {
          framerate = 60;
          bars = 0;
          bar_width = 1;
          bar_spacing = 0;
          lower_cutoff_freq = 0;
          higher_cutoff_freq = 24000;
        };
        input = {
          method = "pipewire";
          source = "mpd.PipeWire";
          virtual = 1;
        };
        output = {
          orientation = "bottom";
          channels = "mono";
          mono_option = "average";
          synchronized_sync = 1;
        };
        color = {
          background = "'#${config.lib.stylix.colors.base00}'";
          foreground = "'#${config.lib.stylix.colors.base0D}'";
          gradient = 1;
          gradient_color_1 = "'#${config.lib.stylix.colors.base0E}'";
          gradient_color_2 = "'#${config.lib.stylix.colors.base0D}'";
          gradient_color_3 = "'#${config.lib.stylix.colors.base0C}'";
          gradient_color_4 = "'#${config.lib.stylix.colors.base0B}'";
          gradient_color_5 = "'#${config.lib.stylix.colors.base0A}'";
          gradient_color_6 = "'#${config.lib.stylix.colors.base09}'";
          gradient_color_7 = "'#${config.lib.stylix.colors.base08}'";
        };
        smoothing.noise_reduction = 15;
      };
    };
  };
}

