{ config, lib, ... }: {
  options.kappeh.shell.btop.enable = lib.mkEnableOption "Enable btop";

  config.programs.btop = lib.mkIf config.kappeh.shell.btop.enable {
    enable = true;

    settings = {
      theme_background = false;
      cpu_single_graph = true;
    };
  };
}

