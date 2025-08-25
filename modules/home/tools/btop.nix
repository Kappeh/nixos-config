{ config, lib, ... }: {
  options.myModules.tools.btop.enable = lib.mkEnableOption "Enable btop";

  config = lib.mkIf config.myModules.tools.btop.enable {
    programs.btop = {
      enable = true;

      settings = {
        theme_background = false;
        cpu_single_graph = true;
      };
    };
  };
}
