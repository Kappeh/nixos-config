{ config, lib, ... }: {
  config.programs.nixvim.plugins.telescope = lib.mkIf config.kappeh.development.nixvim.enable {
    enable = true;
  };
}

