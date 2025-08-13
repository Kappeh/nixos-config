{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.editors.obsidian.enable = lib.mkEnableOption "Enable Obsidian";

  config = lib.mkIf config.myModules.applications.editors.obsidian.enable {
    home = {
      packages = [ pkgs.obsidian ];

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [ ".config/obsidian" ];
      };
    };
  };
}
