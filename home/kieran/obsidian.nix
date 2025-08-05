{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.obsidian ];
    persistence."/persist/home/kieran".directories = [ ".config/obsidian" ];
  };
}
