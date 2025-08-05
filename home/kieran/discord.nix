{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.discord ];
    
    persistence."/persist/home/kieran".directories = [ ".config/discord" ];
  };
}
