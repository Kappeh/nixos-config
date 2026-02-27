{ config, lib, ... }: {
  config.programs.nixvim.plugins.web-devicons.enable = config.myModules.tools.nixvim.enable;
}
