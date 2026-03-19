{ config, lib, pkgs, ... }: {
  config.programs.nixvim.keymaps = lib.mkIf config.myModules.tools.nixvim.enable [
    {
      mode = "n";
      key = "<leader>n";
      action = ":BufferLineCycleNext<CR>";
      options.desc = "Buffer Next";
    }
    {
      mode = "n";
      key = "<leader>p";
      action = ":BufferLineCyclePrev<CR>";
      options.desc = "Buffer Previous";
    }
    {
      mode = "n";
      key = "<leader>x";
      action = ":bd<CR>";
      options.desc = "Delete Buffer";
    }
    {
      mode = "n";
      key = "<leader>w";
      action = ":bp | bd #<CR>";
      options.desc = "Close Buffer";
    }
    {
      mode = "n";
      key = "<leader>h";
      action = "<C-w>h<CR>";
      options.desc = "Switch Pane Left";
    }
    {
      mode = "n";
      key = "<leader>j";
      action = "<C-w>j<CR>";
      options.desc = "Switch Pane Down";
    }
    {
      mode = "n";
      key = "<leader>k";
      action = "<C-w>k<CR>";
      options.desc = "Switch Pane Up";
    }
    {
      mode = "n";
      key = "<leader>l";
      action = "<C-w>l<CR>";
      options.desc = "Switch Pane Right";
    }
    {
      mode = "n";
      key = "<leader>f";
      action = ":Telescope find_files<CR>";
      options.desc = "Find Files";
    }
    {
      mode = "n";
      key = "<leader>g";
      action = ":Telescope live_grep<CR>";
      options.desc = "Find in Files";
    }
    {
      mode = "n";
      key = "<leader>?";
      action = ":Telescope help_tags<CR>";
      options.desc = "Find Help";
    }
    {
      mode = "n";
      key = "<leader>b";
      action = ":Neotree toggle show filesystem right<CR>";
      options.desc = "Toggle File Tree";
    }
    {
      mode = "n";
      key = "<leader>|";
      action = ":Neotree reveal right<CR>";
      options.desc = "Reveal File in Tree";
    }
    {
      mode = "n";
      key = "<leader>s";
      action = ":Neotree toggle show git_status right<CR>";
      options.desc = "Toggle Git Status";
    }
    {
      mode = "n";
      key = "<leader>$";
      action = ":bot sp | term<CR>";
      options.desc = "Split Terminal";
    }
  ];
}
