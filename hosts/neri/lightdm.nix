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
          ${pkgs.xorg.xrandr}/bin/xrandr --output DP-2 --primary --pos 0x0 --mode 1920x1080 --rate 60.00
          ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-0 --right-of DP-2 --mode 2560x1080 --rate 60.00
          ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-0 --pos 1920x0
        '';
      };

      windowManager.bspwm = { enable = true; };
    };
  };
}
