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

  config.myModules.applications = {
    browsers.enable = lib.mkDefault config.myModules.applications.enable;
    editors.enable = lib.mkDefault config.myModules.applications.enable;
    emulation.enable = lib.mkDefault config.myModules.applications.enable;
    file_managers.enable = lib.mkDefault config.myModules.applications.enable;
    gaming.enable = lib.mkDefault config.myModules.applications.enable;
    media.enable = lib.mkDefault config.myModules.applications.enable;
    messaging.enable = lib.mkDefault config.myModules.applications.enable;
    modelling.enable = lib.mkDefault config.myModules.applications.enable;
    misc.enable = lib.mkDefault config.myModules.applications.enable;
    security.enable = lib.mkDefault config.myModules.applications.enable;
    terminals.enable = lib.mkDefault config.myModules.applications.enable;
  };
}
