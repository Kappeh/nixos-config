{ config, lib, ... }: {
  config.programs.nixvim.plugins.trim = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = true;
    settings = {
      highlight = false;
      trim_last_line = false;
      trim_on_write = true;
    };
  };
}
