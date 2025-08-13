{ config, lib, ... }: {
  options.myModules.tools.yazi.enable = lib.mkEnableOption "Enable yazi";

  config = lib.mkIf config.myModules.tools.yazi.enable {
    programs.yazi = {
      enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;

      keymap = {};

      settings = {
        # log.enabled = true;

        manager = {
          ratio = [ 1 4 3 ];
          sort_by = "natural";
          sort_sensitive = false;
          sort_reverse = false;
          sort_dir_first = true;
          sort_translit = true;
          # linemode = "none";
          show_hidden = false;
          show_symlink = true;
          scrolloff = 5;
          # mouse_events = [];
          title_format = "";
        };

        preview = {
          wrap = "no";
          tab_size = 4;
        };

        # opener = {};

        # open.rules = [
        #   { mime = ""; use = ""; }
        # ];

        # tasks = {};

        # plugin = {};

        # input = {
        #   cd_title = "";
        #   create_title =  ["" "" ];
        #   rename_title = "";
        #   filter_title = "";
        #   find_title = [ "" "" ];
        #   search_title = "";
        #   shell_title = [ "" "" ];
        # };

        # confirm = {};

        # select = {
        #   cd_title = "";
        #   create_title =  ["" "" ];
        #   rename_title = "";
        #   filter_title = "";
        #   find_title = [ "" "" ];
        #   search_title = "";
        #   shell_title = [ "" "" ];
        # };

        which = {
          sort_by = "key";
          sort_sensitive = false;
          sort_reverse = false;
          sort_translit = true;
        };
      };

      theme = {
        status = {
          separator_open = "";
          separator_close = "";
        };
      };
    };
  };
}
