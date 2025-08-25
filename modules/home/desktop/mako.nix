{ config, lib, ... }: {
  options.myModules.desktop.mako.enable = lib.mkEnableOption "Enable mako";

  config = lib.mkIf config.myModules.desktop.mako.enable {
    services.mako = {
      enable = true;

      settings = {
        # Behaviour
        sort = "-time";
        max-visible = -1;
        actions = true;
        markup = true;
        icons = true;
        default-timeout = 5000;
        ignore-timeout = false;

        # Actions
        on-button-left = "invoke-default-action";
        on-button-right = "dismiss";

        # History
        history = 1;
        max-history = 5;

        # Location
        output = "DP-2";
        layer = "overlay";
        anchor = "top-right";

        # Layout
        width = 300;
        height = 100;
        margin = "10";
        border-size = 2;
        border-radius = 0;
        padding = "20";
        max-icon-size = 64;

        # Appearance
        text-alignment = "left";
        format = "<b>%s</b>\\n%b";

        "urgency=high".default-timeout = 0;
      };
    };
  };
}
