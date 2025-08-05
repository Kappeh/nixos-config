{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.element-desktop ];
    
    persistence."/persist/home/kieran".directories = [ ".config/Element" ];
  };
}
