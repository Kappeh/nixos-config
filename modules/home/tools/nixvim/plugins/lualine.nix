{ config, lib, ... }: {
  config.programs.nixvim.plugins.lualine = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = true;

    settings = {
      options = {
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "";
          right = "";
        };
        icons_enabled = true;
        disabled_filetypes.statusline = [ "alpha" "neo-tree" ];
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
        lualine_c = [ "filename" "diff" ];
        lualine_x = [ "diagnostics" ];
        lualine_y = [ "encoding" "fileformat" "filetype" ];
        lualine_z = [ "progress" "location" ];
      };
      inactive_sections = {
        lualine_a = [];
        lualine_b = [ "branch" ];
        lualine_c = [ "filename" "diff" ];
        lualine_x = [ "diagnostics" ];
        lualine_y = [ "encoding" "fileformat" "filetype" ];
        lualine_z = [ "progress" "location" ];
      };
    };
  };
}
