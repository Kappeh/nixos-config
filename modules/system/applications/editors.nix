{ config, lib, ... }: {
  options.myModules.applications.editors = {
    enable = lib.mkEnableOption "Enable all editors by default";

    godot.enable = lib.mkEnableOption "Enable Godot";
    obsidian.enable = lib.mkEnableOption "Enable Obsidian";
  };

  config.myModules.applications.editors = {
    godot.enable = lib.mkDefault config.myModules.applications.editors.enable;
    obsidian.enable = lib.mkDefault config.myModules.applications.editors.enable;
  };
}
