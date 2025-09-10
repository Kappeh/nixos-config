{ config, lib, ... }: {
  imports = [
    ./godot.nix
    ./idea.nix
    ./obsidian.nix
    ./vscodium.nix
  ];

  options.myModules.applications.editors.enable = lib.mkEnableOption "Enable editors";

  config.myModules.applications.editors = {
    godot.enable = lib.mkDefault config.myModules.applications.editors.enable;
    idea.enable = lib.mkDefault config.myModules.applications.editors.enable;
    obsidian.enable = lib.mkDefault config.myModules.applications.editors.enable;
    vscodium.enable = lib.mkDefault config.myModules.applications.editors.enable;
  };
}
