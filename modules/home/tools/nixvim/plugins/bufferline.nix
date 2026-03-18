{ config, lib, ... }: {
  config.programs.nixvim.plugins.bufferline = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = true;

    settings = {
      options = {
        always_show_bufferline = true;
        auto_toggle_bufferline = false;
        color_icons = true;
        diagnostics = "nvim_lsp";
        enforce_regular_tabs = true;
        mode = "buffers";
        numbers = "ordinal";
        separator_style = [ "" "" ];
        show_buffer_close_icons = false;
        show_buffer_icons = true;
        show_close_icon = false;
        show_tab_indicators = false;
      };
      highlights = {
        background.bg = "#${config.lib.stylix.colors.base00}";
        buffer_selected = {
          bg = "#${config.lib.stylix.colors.base01}";
          italic = false;
        };
        buffer_visible = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        # close_button
        # close_button_selected
        # close_button_visible
        diagnostic = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        diagnostic_selected = {
          bg = "#${config.lib.stylix.colors.base01}";
          italic = false;
        };
        diagnostic_visible = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        error = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        # error_diagnostic
        # error_diagnostic_selected
        # error_diagnostic_visible
        error_selected = {
          bg = "#${config.lib.stylix.colors.base01}";
          italic = false;
        };
        error_visible = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        # fill
        fill = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        hint = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        # hint_diagnostic
        # hint_diagnostic_selected
        # hint_diagnostic_visible
        hint_selected = {
          bg = "#${config.lib.stylix.colors.base01}";
          italic = false;
        };
        hint_visible = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        indicator_selected.bg = "#${config.lib.stylix.colors.base01}";
        indicator_visible.bg = "#${config.lib.stylix.colors.base00}";
        info = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        # info_diagnostic
        # info_diagnostic_selected
        # info_diagnostic_visible
        info_selected = {
          bg = "#${config.lib.stylix.colors.base01}";
          italic = false;
        };
        info_visible = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        modified = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        modified_selected = {
          bg = "#${config.lib.stylix.colors.base01}";
          italic = false;
        };
        modified_visible = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        numbers = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        numbers_selected = {
          bg = "#${config.lib.stylix.colors.base01}";
          italic = false;
        };
        numbers_visible = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        # offset_separator
        # pick
        # pick_selected
        # pick_visible
        separator.bg = "#${config.lib.stylix.colors.base00}";
        separator_selected.bg = "#${config.lib.stylix.colors.base00}";
        separator_visible.bg = "#${config.lib.stylix.colors.base00}";
        # tab
        # tab_close
        # tab_selected
        # tab_separator
        # tab_separator_selected
        # trunc_marker
        warning = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
        # warning_diagnostic
        # warning_diagnostic_selected
        # warning_diagnostic_visible
        warning_selected = {
          bg = "#${config.lib.stylix.colors.base01}";
          italic = false;
        };
        warning_visible = {
          bg = "#${config.lib.stylix.colors.base00}";
          italic = false;
        };
      };
    };
  };
}
