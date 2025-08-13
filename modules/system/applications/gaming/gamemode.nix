{ config, lib, ... }: {
  options.myModules.applications.gaming.gamemode.enable = lib.mkEnableOption "Enable GameMode";

  config = lib.mkIf config.myModules.applications.gaming.gamemode.enable {
    programs.gamemode = {
      enable = true;
      settings.general.renice = 10;
    };
  };
}
