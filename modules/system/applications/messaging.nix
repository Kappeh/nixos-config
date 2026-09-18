{ config, lib, ... }: {
  options.myModules.applications.messaging = {
    enable = lib.mkEnableOption "Enable all messaging applications by default";

    discord.enable = lib.mkEnableOption "Enable Discord";
    element_desktop.enable = lib.mkEnableOption "Enable Element";
    nixcord.enable = lib.mkEnableOption "Enable Nixcord";
    protonmail_desktop.enable = lib.mkEnableOption "Enable Proton Mail desktop";
    webcord.enable = lib.mkEnableOption "Enable WebCord";
  };

  config.myModules.applications.messaging = {
    discord.enable = lib.mkDefault config.myModules.applications.messaging.enable;
    element_desktop.enable = lib.mkDefault config.myModules.applications.messaging.enable;
    nixcord.enable = lib.mkDefault config.myModules.applications.messaging.enable;
    protonmail_desktop.enable = lib.mkDefault config.myModules.applications.enable;
    webcord.enable = lib.mkDefault config.myModules.applications.messaging.enable;
  };
}
