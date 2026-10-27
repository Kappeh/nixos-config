{
  config.kappeh.desktop = {
    monitors = [
      {
        output = "DP-2";
        mode = "1920x1080@60";
        position = "0x0";
        scale = "1";
        workspaces = [
          "1" "2" "3" "4" "5"
        ];
      }
      {
        output = "HDMI-A-1";
        mode = "2560x1080@60";
        position = "1920x0";
        scale = "1";
        workspaces = [
          "6" "7" "8" "9" "10"
        ];
      }
    ];

    barOutput = "DP-2";
    notificationOutput = "DP-2";
  };
}

