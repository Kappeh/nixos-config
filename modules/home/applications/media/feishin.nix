{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.media.feishin.enable = lib.mkEnableOption "Enable Feishin";

  config = lib.mkIf config.myModules.applications.media.feishin.enable {
    home = {
      packages = [ pkgs.feishin ];

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [ ".config/feishin" ];
      };
    };
  };
}
