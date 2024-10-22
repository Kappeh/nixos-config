{ config, pkgs, ... }: {
  programs.rofi = {
    enable = true;

    configPath = "/home/kieran/.config/rofi/config.rasi";
    location = "center";
    terminal = "${pkgs.alacritty}/bin/alacritty";

    plugins = [
      pkgs.rofi-calc
    ];

    theme = let inherit (config.lib.formats.rasi) mkLiteral; in {
      "*" = {
        width = 512;
        background = mkLiteral "#1E2127FF";
        background-alt = mkLiteral "#282B31FF";
        foreground = mkLiteral "#FFFFFFFF";
        selected = mkLiteral "#61AFEFFF";
        active = mkLiteral "#98C379FF";
        urgent = mkLiteral "#E06C75FF";
        handle-color = mkLiteral "#E06C75FF";
      };

      "window" = {
        transparency = "real";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        fullscreen = false;
        width = mkLiteral "600px";
        x-offset = mkLiteral "0px";
        y-offset = mkLiteral "0px";
        enabled = true;
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "1px solid";
        border-color = mkLiteral "@selected";
        cursor = "default";
        background-color = mkLiteral "@background";
      };

      "mainbox" = {
        enabled = true;
        spacing = mkLiteral "5px";
        margin = mkLiteral "0px";
        padding = mkLiteral "5px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px 0px 0px 0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "transparent";
        children = [ "inputbar" "message" "listview" ];
      };

      "inputbar" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "5px";
        border = mkLiteral "0px 0px 1px solid 0px";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
        children = [ "prompt" "entry" ];
      };

      "prompt" = {
        enabled = true;
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "textbox-prompt-colon" = {
        enabled = true;
        expand = false;
        str = ":";
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "@foreground";
      };

      "entry" = {
        enabled = true;
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "text";
        placeholder = "Search...";
        placeholder-cursor = mkLiteral "inherit";
      };

      "listview" = {
        enabled = true;
        columns = 1;
        lines = 12;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;

        spacing = mkLiteral "0px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = "default";
      };

      "scrollbar" = {
        handle-width = mkLiteral "5px";
        handle-color = mkLiteral "@handle-color";
        border-radius = mkLiteral "0px";
        background-color = mkLiteral "@background-alt";
      };

      "element" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = mkLiteral "pointer";
      };

      "element normal.normal" = {
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };

      "element normal.urgent" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@background";
      };

      "element normal.active" = {
        background-color = mkLiteral "@active";
        text-color = mkLiteral "@background";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@selected";
        text-color = mkLiteral "@background";
      };

      "element selected.urgent" = {
        background-color = mkLiteral "@active";
        text-color = mkLiteral "@background";
      };

      "element selected.active" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@background";
      };

      "element alternate.normal" = {
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };

      "element alternate.urgent" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@background";
      };

      "element alternate.active" = {
        background-color = mkLiteral "@active";
        text-color = mkLiteral "@background";
      };

      "element-icon" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        size = mkLiteral "24px";
        cursor = mkLiteral "inherit";
      };

      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        highlight = mkLiteral "inherit";
        cursor = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };

      "mode-switcher" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
      };

      "button" = {
        padding = mkLiteral "10px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "pointer";
      };

      "button selected" = {
        background-color = mkLiteral "@selected";
        text-color = mkLiteral "@background";
      };

      "message" = {
        enabled = true;
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px 0px 0px 0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
      };

      "textbox" = {
        padding = mkLiteral "5px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
        highlight = mkLiteral "none";
        placeholder-color = mkLiteral "@foreground";
        blink = true;
        markup = true;
      };

      "error-message" = {
        padding = mkLiteral "5px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@selected";
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };
    };
  };
}
