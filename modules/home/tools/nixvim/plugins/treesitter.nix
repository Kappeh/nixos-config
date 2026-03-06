{ config, lib, ... }: {
  config.programs.nixvim.plugins.treesitter = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = true;
    highlight.enable = true;
    indent.enable = true;
    folding.enable = true;
  };
}
