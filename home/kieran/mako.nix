{ config, ... }: {
  config.services.mako = {
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
      border-size = 1;
      border-radius = 0;
      padding = "20";
      max-icon-size = 64;

      # Appearance
      background-color = "#111127";
      border-color = "#434380";
      text-color = "#82aaff";
      text-alignment = "left";
      font = "monospace 10";
      format = "<b>%s</b>\\n%b";

      "urgency=low".text-color = "#747495";
      "urgency=normal".text-color = "#82aaff";
      "urgency=high" = {
        text-color = "#e97a7a";
        default-timeout = 0;
      };
    };
  };
}
