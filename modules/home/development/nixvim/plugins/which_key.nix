{ config, lib, ... }: {
  config.programs.nixvim.plugins.which-key = lib.mkIf config.kappeh.development.nixvim.enable {
    enable = true;
    autoLoad = true;
  };
}

