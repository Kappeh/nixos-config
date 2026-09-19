{ config, lib, pkgs, ... }: {
  options.kappeh.applications.obsidian.enable = lib.mkEnableOption "Enable Obsidian";

  config.home = lib.mkIf config.kappeh.applications.obsidian.enable {
    persistence."/persist".directories = [ ".config/obsidian" ];

    packages = [ pkgs.obsidian ];
  };
}

