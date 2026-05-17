{ config, lib, ... }: {
  imports = [
    ./webcord/default.nix
    ./discord.nix
    ./element_desktop.nix
    ./nixcord/default.nix
  ];

  options.myModules.applications.messaging.enable = lib.mkEnableOption "Enable messaging applications";

  config.myModules.applications.messaging = {
    webcord.enable = lib.mkDefault config.myModules.applications.messaging.enable;
    discord.enable = lib.mkDefault config.myModules.applications.messaging.enable;
    element_desktop.enable = lib.mkDefault config.myModules.applications.messaging.enable;
    nixcord.enable = false;
  };
}
