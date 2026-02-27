{ config, lib, ... }: {
  config.programs.nixvim.plugins.colorizer = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = true;
  };
}

