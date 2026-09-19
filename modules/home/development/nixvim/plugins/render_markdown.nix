{ config, lib, ... }: {
  config.programs.nixvim.plugins.render-markdown = lib.mkIf config.kappeh.development.nixvim.enable {
    enable = true;
  };
}

