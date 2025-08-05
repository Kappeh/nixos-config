{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.conda ];

    persistence."/persist/home/kieran".directories = [ ".conda" ];
  };
}
