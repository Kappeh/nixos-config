{ config, lib, pkgs, ... }: {
  options.myModules.applications.editors.obsidian.enable = lib.mkEnableOption "Enable Obsidian";

  config = lib.mkIf config.myModules.applications.editors.obsidian.enable {
    home = {
      packages = [ pkgs.obsidian ];

      persistence."/persist/home/${config.home.username}".directories = [ ".config/obsidian" ];
    };
  };
}
