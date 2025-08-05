{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.ncpamixer ];
    
    persistence."/persist/home/kieran".files = [ ".ncpamixer.conf" ];
  };
}
