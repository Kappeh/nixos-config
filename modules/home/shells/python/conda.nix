{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.conda ];

    persistence."/persist/home/${config.home.username}".directories = [ ".conda" ];
  };
}
