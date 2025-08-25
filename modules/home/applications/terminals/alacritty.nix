{ config, lib, ... }: {
  options.myModules.applications.terminals.alacritty.enable = lib.mkEnableOption "Enable Alacritty";

  config = lib.mkIf config.myModules.applications.terminals.alacritty.enable {
    programs.alacritty = {
      enable = true;

      settings = {
        window = {
          opacity = 1.0;
          padding = { x = 20; y = 20; };
          # dynamic_padding = true;
        };
        scrolling = {
          multiplier = 1;
          history = 10000;
        };
        cursor.style = {
          shape = "Beam";
          blinking = "On";
        };
      };
    };
  };
}
