{ config, lib, pkgs, ... }: {
  options.myModules.applications.messaging.discord.enable = lib.mkEnableOption "Enable Discord";

  config = lib.mkIf config.myModules.applications.messaging.discord.enable {
    home = {
      packages = [ pkgs.discord ];

      persistence."/persist/home/${config.home.username}".directories = [ ".config/discord" ];
    };
  };
}
