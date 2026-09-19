{ config, lib, ... }: {
  config.programs.nixvim.plugins.colorizer = lib.mkIf config.kappeh.development.nixvim.enable {
    enable = true;
  };
}

