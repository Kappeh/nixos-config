{ config, lib, ... }: {
  options.kappeh.gaming.gamemode.enable = lib.mkEnableOption "Enable GameMode";

  config = lib.mkIf config.kappeh.gaming.gamemode.enable {
    programs.gamemode = {
      enable = true;
      settings.general.renice = 10;
    };

    # Allow gamemode user daemon to change CPU governor or niceness
    users.users.kieran.extraGroups = [ "gamemode" ];
  };
}

