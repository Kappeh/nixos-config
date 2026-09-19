{ config, lib, ... }: {
  config.programs.nixvim.plugins.treesitter = lib.mkIf config.kappeh.development.nixvim.enable {
    enable = true;
    highlight.enable = true;
    indent.enable = true;
    folding.enable = true;
  };
}

