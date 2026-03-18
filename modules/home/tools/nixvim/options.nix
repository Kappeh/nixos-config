{ config, lib, ... }: {
  config.programs.nixvim = lib.mkIf config.myModules.tools.nixvim.enable {
    enableMan = true;     # Install the man pages for NixVim options

    defaultEditor = true; # Enable nixvim as the default editor
    vimdiffAlias = true;  # Alias `vimdiff` to `nvim -d`

    clipboard = {
      # Use system clipboard (requires xclip/wl-clipboard)
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    editorconfig.enable = true; # Enable editorconfig plugin for neovim

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      # Line Numbering & Cursor Position
      number = true;              # Print the line number in front of each line
      relativenumber = true;      # Show the line number relative to the line with the cursor in front of each line
      numberwidth = 4;            # Minimal number of columns to use for the line number
      cursorline = true;          # Highlight the current line
      ruler = true;               # Show line and column number of the cursor position

      # Window & Layout
      signcolumn = "yes:1";       # Always show the signcolumn, otherwise text would be shifted when displaying error icons
      colorcolumn = "80,120";     # Highlight columns 80 and 120
      laststatus = 2;             # The last window will always have a status line
      splitright = true;          # Splitting a window will put the new window right of the current one
      splitbelow = true;          # Splitting a window will put the new window below the current one

      # Indentation & Tabs
      tabstop = 4;                # The number of columns occupied by a tab
      softtabstop = 4;            # See multiple spaces as tabstops so `<BS>` does the right thing
      expandtab = true;           # Converts tabs to spaces
      shiftwidth = 4;             # Width for autoindents
      shiftround = true;          # Round indent to multiple of `shiftwidth`
      autoindent = true;          # Copy indent from current line when starting a new line

      # Search & Case Sensitivity
      ignorecase = true;          # Ignore case in search patterns
      smartcase = true;           # Override the `ignorecase` option if the search pattern contains upper case characters
      hlsearch = true;            # When there is a previous search pattern, highlight all its matches
      incsearch = true;           # While typing a search command, show where the pattern, as it was typed so far, matches

      # Scrolling & Viewing
      scrolloff = 5;              # The minimal number of screen lines to keep above and below the cursor
      sidescrolloff = 10;         # The minimal number of screen columns to keep to the left and to the right of the cursor
      wrap = false;               # Disable wrapping

      # General UI & Behavior
      foldenable = false;         # Disable folds
      showmode = false;           # Don't show mode, the lualine plugin does this
      cmdheight = 0;               # Disable command line area
      showtabline = 2;            # Always show tab line
      startofline = true;         # Move the cursor to the first non-blank of the line for some operations
      termguicolors = true;       # Enables 24-bit RGB color in the TUI
      fillchars.eob = " ";        # Character to fill empty lines

      # Misc
      belloff = "all";            # Silence bell for all events
    };
  };
}
