{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.myModules.tools.nixvim.enable {
    plugins.trouble.enable = true;
    keymaps = [
      {
        mode = "n";
        key = "<leader>d";
        action = ":Trouble diagnostics toggle focus=false filter.buf=0<CR>";
        options.desc = "Toggle Diagnostics";
      }
      {
        mode = "n";
        key = "<leader>D";
        action = ":Trouble diagnostics focus=true filter.buf=0<CR>";
        options.desc = "Focus Diagnostics";
      }
    ];
  };
}
