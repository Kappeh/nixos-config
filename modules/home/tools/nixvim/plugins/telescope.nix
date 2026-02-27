{ config, lib, ... }: {
  config.programs.nixvim.plugins.telescope = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = true;
  };
}
