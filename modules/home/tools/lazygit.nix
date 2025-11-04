{ config, lib, ... }: {
  options.myModules.tools.lazygit.enable = lib.mkEnableOption "Enable Lazygit";

  config = lib.mkIf config.myModules.tools.lazygit.enable {
    programs.lazygit = {
      enable = true;

      settings = {
        gui = {
          scrollHeight = 2;
          scrollPastBottom = true;
          scrollOffMargin = 2;
          scrollOffBehavior = "margin";
          tabWidth = 4;
          sidePanelWidth = 0.33;
          useHunkModeInStagingView = false;
          timeFormat = "Monday 02/01/2006 15:04:05";
          shortTimeFormat = "15:04:05";
        };
        git = {
          autoFetch = false;
          autoRefresh = false;
          autoForwardBranches = "none";
          autoStageResolvedConflicts = false;
          disableForcePushing = false;
        };
        update.method = "never";
        confirmOnQuit = false;
        quitOnTopLevelReturn = false;
        disableStartupPopups = true;
      };
    };
  };
}
