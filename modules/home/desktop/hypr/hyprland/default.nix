{ config, inputs, lib, pkgs, ... }: {
  config.wayland.windowManager.hyprland = lib.mkIf config.myModules.desktop.enable {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    configType = "lua";

    xwayland.enable = true;
    systemd.enable = true;

    extraLuaFiles = {
      "environment.lua" = { content = ./environment.lua; autoLoad = true; };
      "monitors.lua" = { content = ./monitors.lua; autoLoad = true; };
      "workspaces.lua" = { content = ./workspaces.lua; autoLoad = true; };
      "input.lua" = { content = ./input.lua; autoLoad = true; };
      "commands.lua" = let
        alacritty = "${pkgs.alacritty}/bin/alacritty";
        pcmanfm = "${pkgs.pcmanfm}/bin/pcmanfm";
        rofi = "${pkgs.rofi}/bin/rofi";
        wlr_which_key = "${pkgs.wlr-which-key}/bin/wlr-which-key";
        bluetui = "${pkgs.bluetui}/bin/bluetui";
        pulsemixer = "${pkgs.pulsemixer}/bin/pulsemixer";
        qalculate_qt = "${pkgs.qalculate-qt}/bin/qalculate-qt";
        hyprpicker = "${pkgs.hyprpicker}/bin/hyprpicker";
        grim = "${pkgs.grim}/bin/grim";
        slurp = "${pkgs.slurp}/bin/slurp";
        swappy = "${pkgs.swappy}/bin/swappy";
        wl_copy = "${pkgs.wl-clipboard}/bin/wl-copy";
      in ''
        terminal = '${alacritty}'
        fileManager = '${pcmanfm}'
        launcher = '${rofi} -show drun'
        menu = '${wlr_which_key}'
        bluetoothManager = '${alacritty} -e ${bluetui}'
        volumeMixer = '${alacritty} -e ${pulsemixer}'
        calculator = '${qalculate_qt}'
        colorPicker = '${hyprpicker} --autocopy --format=hex --quiet'
        screenshot_region = '${grim} -g "$(${slurp})" - | ${wl_copy}'
        screenshot_region_edit = '${grim} -g "$(${slurp})" - | ${swappy} -f -'
        power_menu = '${wlr_which_key} -k "p"'
      '';
      "binds.lua" = { content = ./binds.lua; autoLoad = true; };
      "colors.lua" = ''
        base00 = 0xff${config.lib.stylix.colors.base00}
        base01 = 0xff${config.lib.stylix.colors.base01}
        base02 = 0xff${config.lib.stylix.colors.base02}
        base03 = 0xff${config.lib.stylix.colors.base03}
        base04 = 0xff${config.lib.stylix.colors.base04}
        base05 = 0xff${config.lib.stylix.colors.base05}
        base06 = 0xff${config.lib.stylix.colors.base06}
        base07 = 0xff${config.lib.stylix.colors.base07}
        base08 = 0xff${config.lib.stylix.colors.base08}
        base09 = 0xff${config.lib.stylix.colors.base09}
        base0A = 0xff${config.lib.stylix.colors.base0A}
        base0B = 0xff${config.lib.stylix.colors.base0B}
        base0C = 0xff${config.lib.stylix.colors.base0C}
        base0D = 0xff${config.lib.stylix.colors.base0D}
        base0E = 0xff${config.lib.stylix.colors.base0E}
        base0F = 0xff${config.lib.stylix.colors.base0F}
      '';
      "general.lua" = { content = ./general.lua; autoLoad = true; };
      "animations.lua" = { content = ./animations.lua; autoLoad = true; };
      "autostart.lua" = { content = ./autostart.lua; autoLoad = true; };
    };
  };
}
