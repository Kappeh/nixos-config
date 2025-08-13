{ config, lib, ... }: {
  imports = [
    ./browsers/default.nix
    ./editors/default.nix
    ./emulation/default.nix
    ./file_managers/default.nix
    ./gaming/default.nix
    ./media/default.nix
    ./messaging/default.nix
    ./modelling/default.nix
    ./misc/default.nix
    ./security/default.nix
    ./terminals/default.nix
  ];

  options.myModules.applications.enable = lib.mkEnableOption "Enable applications";

  config = lib.mkIf config.myModules.applications.enable {
    myModules.applications = {
      browsers.enable = lib.mkDefault true;
      editors.enable = lib.mkDefault true;
      emulation.enable = lib.mkDefault true;
      file_managers.enable = lib.mkDefault true;
      gaming.enable = lib.mkDefault true;
      media.enable = lib.mkDefault true;
      messaging.enable = lib.mkDefault true;
      modelling.enable = lib.mkDefault true;
      misc.enable = lib.mkDefault true;
      security.enable = lib.mkDefault true;
      terminals.enable = lib.mkDefault true;
    };
  };
}
