{ config, ... }: {
  config.services.flameshot = {
    enable = true;

    settings = {
      General = {
        autoCloseIdleDaemon = false;
        contrastOpacity = 188;
        contrastUiColor = "#60409c";
        disabledTrayIcon = false;
        drawColor = "#800000";
        filenamePattern = "%Y-%m-%d_%H-%M-%S";
        saveAsFileExtension = "png";
        savePath = "/home/kieran/Pictures/Screenshots";
        showDesktopNotification = true;
        showSelectionGeometryHideTime = 3000;
        showStartupLaunchMessage = false;
        startupLaunch = true;
        uiColor = "#2e78d3";
        uploadHistoryMax = 22;
      };
    };
  };
}
