{ pkgs, inputs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    userSettings = {
      "editor.acceptSuggestionOnEnter" = "off";
      "editor.bracketPairColorization.enabled" = false;
      "editor.cursorBlinking" = "smooth";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.find.autoFindInSelection" = "always";
      "editor.fontFamily" = "Cascadia Code";
      "editor.fontLigatures" = true;
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnSaveMode" = "modifications";
      "editor.inlayHints.enabled" = "off";
      "editor.smoothScrolling" = true;
      "files.autoSave" = "afterDelay";
      "files.autoSaveWhenNoErrors" = true;
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;
      "files.trimTrailingWhitespace" = true;
      "gitlens.showWelcomeOnInstall" = false;
      "gitlens.showWhatsNewAfterUpgrades" = false;
      "terminal.integrated.scrollback" = 10000;
      "update.showReleaseNotes" = false;
      "window.density.editorTabHeight" = "default";
      "workbench.activityBar.location" = "top";
      "workbench.colorTheme" = "Calvera Dark";
      "workbench.editor.enablePreview" = false;
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.sideBar.location" = "right";
      "workbench.startupEditor" = "none";
      "workbench.tree.renderIndentGuides" = "always";
    };

    mutableExtensionsDir = true;

    extensions = with inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace; [
      bbenoist.nix
      catppuccin.catppuccin-vsc-icons
      eamodio.gitlens
      editorconfig.editorconfig
      ms-azuretools.vscode-docker
      rust-lang.rust-analyzer
      saurabh.calvera-dark
      serayuzgur.crates
      streetsidesoftware.code-spell-checker
      tamasfe.even-better-toml
      usernamehw.errorlens
      vadimcn.vscode-lldb
    ];
  };
}
