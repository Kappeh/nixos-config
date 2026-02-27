{ config, lib, ... }: {
  config.programs.nixvim.plugins = lib.mkIf config.myModules.tools.nixvim.enable {
    cmp = {
      enable = true;
      autoEnableSources = false;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "dictionary"; }
          { name = "emoji"; }
        ];
        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-Tab>" = "cmp.mapping.complete()";
          "<Tab>" = "cmp.mapping.confirm({ select = true })";
        };
      };
    };
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    cmp-dictionary.enable = true;
    cmp-emoji.enable = true;
  };
}

