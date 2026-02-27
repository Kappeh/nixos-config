{ config, lib, ... }: {
  config.programs.nixvim.plugins.comment = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = true;
    settings = {
      opleader.line = "<leader>/";
      toggler.line = "<leader>/";
    };
  };
}

