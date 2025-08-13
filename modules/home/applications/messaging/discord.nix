{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.messaging.discord.enable = lib.mkEnableOption "Enable Discord";

  config = lib.mkIf config.myModules.applications.messaging.discord.enable {
    home = {
      packages = [ pkgs.discord ];

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [ ".config/discord" ];
      };
    };
  };
}
