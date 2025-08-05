{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.gqrx ];

    persistence."/persist/home/kieran".directories = [ ".config/gqrx" ];
  };
}
