{ config, lib, ... }: {
  config.programs.nixvim.plugins.neo-tree = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = true;
    settings = {
      filesystem.hijack_netrw_behavior = "disabled";
      enable_git_status = true;
      enable_modified_markers = true;
      enable_diagnostics = true;
      hide_root_node = true;
      retain_hidden_root_indent = false;
      window = {
        position = "right";
        width = 40;
        auto_expand_width = false;
        insert_as = "sibling";
      };
    };
  };
}
