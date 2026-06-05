{ config, lib, pkgs, ... }: {
  options.myModules.desktop.rofi.enable = lib.mkEnableOption "Enable Rofi";

  config = lib.mkIf config.myModules.desktop.rofi.enable {
    home.packages = [
      pkgs.rofi-power-menu
    ];

    programs.rofi = {
      enable = true;

      plugins = [
        pkgs.rofi-calc
        pkgs.rofi-power-menu
      ];

      modes = [
        "window"
        "run"
        "drun"
        # "ssh"
        # "keys"
      ];

      location = "center";
      xoffset = 0;
      yoffset = 0;
      cycle = true;
      terminal = "${pkgs.alacritty}/bin/alacritty";

      extraConfig = {
        disable-history = true;
        show-icons = false;
        kb-primary-paste = "Control+V,Shift+Insert";
        kb-secondary-paste = "Control+v,Insert";
      };

      theme = let inherit (config.lib.formats.rasi) mkLiteral; in {
        "*" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base00}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base07}";
        };

        window = {
          padding = mkLiteral "5px";
          border = mkLiteral "2px solid";
          border-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
        };

        inputbar.margin = mkLiteral "5px";

        prompt.enabled = false;

        entry = {
          padding = mkLiteral "10px";
          placeholder = "";
          background-color = mkLiteral "#${config.lib.stylix.colors.base01}";
        };

        num-filtered-rows.enabled = false;
        num-rows.enabled = false;
        case-indicator.enabled = false;

        message.margin = mkLiteral "5px";

        textbox.padding = mkLiteral "5px";

        listview.margin = mkLiteral "5px";

        element = {
          orientation = mkLiteral "horizontal";
          children = [
            (mkLiteral "element-index")
            (mkLiteral "element-text")
          ];
        };

        "element.selected" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base0D}";
          text-color = mkLiteral "#${config.lib.stylix.colors.base01}";
        };

        element-index = {
          padding = mkLiteral "5px";
          vertical-align = mkLiteral "0.5";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        element-text = {
          padding = mkLiteral "5px";
          vertical-align = mkLiteral "0.5";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        mode-switcher = {
          margin = mkLiteral "5px";
          padding = mkLiteral "5px";
        };

        error-message = {
          margin = mkLiteral "5px";
          padding = mkLiteral "5px";
        };
      };
    };

    stylix.targets.rofi = {
      enable = true;
      colors.enable = false;
      fonts.enable = true;
    };
  };
}
