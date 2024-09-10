{ pkgs, ... }: {
  services = {
    displayManager = {
      defaultSession = "none+bspwm";
      autoLogin = {
        enable = true;
        user = "kieran";
      };
    };

    xserver = {
      enable = true;

      displayManager = {
        lightdm = {
          enable = true;
          greeters.slick.enable = true;
          # background = background.png
        };
        setupCommands = ''
          ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-0 --primary --pos 1366x0 --mode 1920x1080 --rate 60.00
          ${pkgs.xorg.xrandr}/bin/xrandr --output DP-2 --left-of HDMI-0 --mode 1366x768 --rate 60.00
          ${pkgs.xorg.xrandr}/bin/xrandr --output DP-2 --pos 0x312
        '';
      };

      windowManager.bspwm = { enable = true; };
    };
  };
}
