{ config, lib, ... }: {
  imports = [
    ./browsers.nix
    ./editors.nix
    ./file_managers.nix
    ./gaming/default.nix
    ./media/default.nix
    ./messaging.nix
    ./misc/default.nix
    ./modelling.nix
    ./security.nix
    ./terminals.nix
  ];

  options.myModules.applications.enable = lib.mkEnableOption "Enable all applications by default";

  config.myModules.applications = {
    browsers.enable = lib.mkDefault config.myModules.applications.enable;
    editors.enable = lib.mkDefault config.myModules.applications.enable;
    file_managers.enable = lib.mkDefault config.myModules.applications.enable;
    gaming.enable = lib.mkDefault config.myModules.applications.enable;
    media.enable = lib.mkDefault config.myModules.applications.enable;
    messaging.enable = lib.mkDefault config.myModules.applications.enable;
    misc.enable = lib.mkDefault config.myModules.applications.enable;
    modelling.enable = lib.mkDefault config.myModules.applications.enable;
    security.enable = lib.mkDefault config.myModules.applications.enable;
    terminals.enable = lib.mkDefault config.myModules.applications.enable;
  };
}
