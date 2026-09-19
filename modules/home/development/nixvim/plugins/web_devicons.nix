{ config, lib, ... }: {
  config = lib.mkIf config.kappeh.development.nixvim.enable {
    programs.nixvim.plugins.web-devicons.enable = true;
  };
}

