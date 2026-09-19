{ config, lib, ... }: {
  options.kappeh.communication = {
    enable = lib.mkEnableOption "Enable all messaging applications by default";

    discord.enable = lib.mkEnableOption "Enable Discord";
    element_desktop.enable = lib.mkEnableOption "Enable Element";
    nixcord.enable = lib.mkEnableOption "Enable Nixcord";
    protonmail_desktop.enable = lib.mkEnableOption "Enable Proton Mail desktop";
    webcord.enable = lib.mkEnableOption "Enable WebCord";
  };

  config.kappeh.communication = with config.kappeh; {
    discord.enable = lib.mkDefault communication.enable;
    element_desktop.enable = lib.mkDefault communication.enable;
    nixcord.enable = lib.mkDefault communication.enable;
    protonmail_desktop.enable = lib.mkDefault communication.enable;
    webcord.enable = lib.mkDefault communication.enable;
  };
}

