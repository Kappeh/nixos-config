{ config, lib, ... }: {
  options.myModules.applications.terminals.kitty.enable = lib.mkEnableOption "Enable Kitty";

  config = lib.mkIf config.myModules.applications.terminals.kitty.enable {
    programs.kitty = {
      enable = true;

      settings = {
        scrollback_lines = 10000;
        enable_audio_bell = false;
        update_check_interval = 0;
        window_padding_width = 15;
      };
    };
  };
}
