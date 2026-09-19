{ config, lib, ... }: {
  options.kappeh.communication.nixcord.enable = lib.mkEnableOption "Enable Nixcord";

  config = lib.mkIf config.kappeh.communication.nixcord.enable {
    home.persistence."/persist".directories = [
      ".config/discord"
      ".config/Vencord/settings"
    ];

    stylix.targets.nixcord.extraCss = builtins.readFile ./extra.css;

    programs.nixcord = {
      enable = true;
      discord.vencord.enable = true;
    };
  };
}

