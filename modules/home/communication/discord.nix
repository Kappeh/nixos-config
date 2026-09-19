{ config, lib, pkgs, ... }: {
  options.kappeh.communication.discord.enable = lib.mkEnableOption "Enable Discord";

  config = lib.mkIf config.kappeh.communication.discord.enable {
    home = {
      packages = [ pkgs.discord ];

      persistence."/persist".directories = [ ".config/discord" ];
    };
  };
}

