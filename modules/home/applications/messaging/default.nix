{ config, lib, ... }: {
  imports = [
    ./webcord/default.nix
    ./discord.nix
    ./element_desktop.nix
    ./nixcord/default.nix
  ];

  options.myModules.applications.messaging.enable = lib.mkEnableOption "Enable messaging applications";

  config = lib.mkIf config.myModules.applications.messaging.enable {
    myModules.applications.messaging = {
      webcord.enable = lib.mkDefault true;
      # discord.enable = lib.mkDefault false;
      element_desktop.enable = lib.mkDefault true;
      nixcord.enable = lib.mkDefault true;
    };
  };
}
