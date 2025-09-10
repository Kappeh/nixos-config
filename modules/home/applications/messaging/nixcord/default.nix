{ config, lib, ... }: {
  options.myModules.applications.messaging.nixcord.enable = lib.mkEnableOption "Enable Nixcord";

  config = lib.mkIf config.myModules.applications.messaging.nixcord.enable {
    stylix.targets.nixcord.extraCss = builtins.readFile ./extra.css;

    programs.nixcord.enable = true;

    home.persistence."/persist/home/${config.home.username}".directories = [ ".config/discord" ];
  };
}
