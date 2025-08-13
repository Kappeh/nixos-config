{ config, lib, ... }: {
  imports = [
    ./godot.nix
    ./idea.nix
    ./obsidian.nix
    ./vscodium.nix
  ];

  options.myModules.applications.editors.enable = lib.mkEnableOption "Enable editors";

  config = lib.mkIf config.myModules.applications.editors.enable {
    myModules.applications.editors = {
      godot.enable = lib.mkDefault true;
      idea.enable = lib.mkDefault true;
      obsidian.enable = lib.mkDefault true;
      vscodium.enable = lib.mkDefault true;
    };
  };
}
