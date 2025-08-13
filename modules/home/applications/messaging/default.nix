{ config, lib, ... }: {
  imports = [
    ./webcord/default.nix
    ./discord.nix
    ./element_desktop.nix
  ];

  options.myModules.applications.messaging.enable = lib.mkEnableOption "Enable messaging applications";

  config = lib.mkIf config.myModules.applications.messaging.enable {
    myModules.applications.messaging = {
      webcord.enable = lib.mkDefault true;
      discord.enable = lib.mkDefault true;
      element_desktop.enable = lib.mkDefault true;
    };
  };
}
