{ config, lib, ... }: {
  config.programs.nixvim.plugins.render-markdown = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = true;
  };
}

