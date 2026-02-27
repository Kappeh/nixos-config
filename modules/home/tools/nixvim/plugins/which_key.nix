{ config, lib, ... }: {
  config.programs.nixvim.plugins.which-key = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = true;
    autoLoad = true;
  };
}
