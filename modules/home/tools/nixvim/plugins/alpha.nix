{ config, lib, ... }: {
  config.programs.nixvim.plugins.alpha = lib.mkIf config.myModules.tools.nixvim.enable {
    enable = true;
    autoLoad = true;
    settings = {
      layout = [
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "Type";
            position = "center";
          };
          type = "text";
          val = [
            "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗"
            "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║"
            "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║"
            "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║"
            "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = [
            {
              type = "button";
              val = " New File";
              opts = {
                keymap = [ "n" "n" ":ene<CR>" { noremap = true; silent = true; nowait = true; } ];
                shortcut = "n";
                position = "center";
                cursor = 3;
                hl = "Normal";
                width = 40;
                align_shortcut = "right";
                hl_shortcut = "Title";
              };
            }
            {
              type = "button";
              val = " Quit Neovim";
              opts = {
                keymap = [ "n" "q" ":qa<CR>" { noremap = true; silent = true; nowait = true; } ];
                shortcut = "q";
                position = "center";
                cursor = 3;
                hl = "Normal";
                width = 40;
                align_shortcut = "right";
                hl_shortcut = "Title";
              };
            }
          ];
        }
      ];
    };
  };
}
