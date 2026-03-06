{ config, lib, pkgs, ... }: {
  options.myModules.applications.editors.obsidian.enable = lib.mkEnableOption "Enable Obsidian";

  config = lib.mkIf config.myModules.applications.editors.obsidian.enable {
    home = {
      packages = [ pkgs.obsidian ];

      persistence."/persist".directories = [ ".config/obsidian" ];
    };
  };
}
