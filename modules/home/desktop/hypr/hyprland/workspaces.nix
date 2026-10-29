{ config, lib, ... }: {
  config.wayland.windowManager.hyprland = lib.mkIf config.kappeh.desktop.enable {
    extraLuaFiles."workspaces.lua" = {
      autoLoad = true;
      content = lib.concatMapStringsSep "\n" (monitor:
        lib.concatMapStringsSep "\n" (workspace: ''
          hl.workspace_rule({
              workspace = ${builtins.toJSON workspace},
              monitor = ${builtins.toJSON monitor.output},
          })
        '') monitor.workspaces
      ) config.kappeh.desktop.monitors;
    };
  };
}

