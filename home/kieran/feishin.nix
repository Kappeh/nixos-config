{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.feishin ];

    persistence."/persist/home/kieran".directories = [ ".config/feishin" ];
  };
}
