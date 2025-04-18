{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.r2modman ];

    persistence."/persist/home/kieran".directories = [
      ".config/r2modman"
      ".config/r2modmanPlus-local"
    ];
  };
}
