{ config, lib, ... }: {
  config.programs.nixvim.plugins.smear-cursor = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = false;
    settings = {
      hide_target_hack = false;
      stiffness = 0.8;
      trailing_stiffness = 0.8;
      matrix_pixel_threshold = 0.5;
      stiffness_insert_mode = 0.7;
      trailing_stiffness_mode = 0.7;
      damping = 0.95;
      damping_insert_mode = 0.95;
      distance_stop_animating = 0.5;
    };
  };
}

