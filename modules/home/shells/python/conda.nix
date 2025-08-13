{ config, osConfig, lib, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.conda ];

    persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [ ".conda" ];
    };
  };
}
