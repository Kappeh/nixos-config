{ config, lib, ... }: {
  config.wayland.windowManager.hyprland = lib.mkIf config.kappeh.desktop.enable {
    extraLuaFiles."monitors.lua" = {
      autoLoad = true;
      content = lib.concatMapStringsSep "\n" (monitor: ''
        hl.monitor({
          output = ${builtins.toJSON monitor.output},
          mode = ${builtins.toJSON monitor.mode},
          position = ${builtins.toJSON monitor.position},
          scale = ${builtins.toJSON monitor.scale},
        })
      '') config.kappeh.desktop.monitors;
    };
  };
}

